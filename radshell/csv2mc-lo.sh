#!/bin/bash

# create LO,GW,Rel,obj


AWK="awk -F,"

function usage() {
    cat <<EOF
Usage: $0 {LO|GW|REL} <file name> [service name [complex name]]
EOF
    exit 0
}


function lo() {
    [ $1a = "a" ] && usage
    cat <<EOF
divert(-1)
######
# Линейные объекты
######
TEMPL_NAME(rzd_LineObject)
divert(5)dnl
EOF
    $AWK '{print "SERVICE("$3","$1","$2")dnl"}' $1
    
    [ $2a = "a" ] && exit 0
    
    cat <<EOF

divert(7)dnl
dnl Relations
dnl ASUT -> LO
EOF
    echo "PARENT($2)dnl"
    $AWK '{print "CHILD("$3")dnl"}' $1

    [ $3a = "a" ] && exit 0
    cat <<EOF

dnl LO -> Complex
EOF
    $AWK -v CN=$3 '{print "PARENT("$3")dnl\nCHILD("CN")dnl"}' $1
}

function gw() {
        [ $1a = "a" ] && usage
    cat <<EOF
divert(-1)
###
# Шлюзы
# EventId: NmosPingFail
###
_template_EP_ITNM
divert(5)dnl
EOF
    $AWK '{print "SERVICE("$5","$2","$1" ("$3"))dnl\nVALUES(NmosPingFail,"$4")dnl\n__RESP"}' $1

    cat <<EOF

divert(7)dnl
dnl Relation
dnl LO -> GW
EOF
    $AWK '{print "PARENT("$6")dnl\nCHILD("$5")dnl"}' $1
}

function rel() {
    [ $1a = "a" ] && usage
    cat <<EOF
divert(7)dnl
dnl Relations for exist object
EOF

    $AWK '{print "PARENT("$4")dnl\nCHILD("$3")dnl"}' $1
}

########
# Start process
########

if [ $1a = "a" ]; then
    usage
fi


case $1 in
    "LO") lo $2 $3 $4 ;;
    "GW") gw $2 ;;
    "REL") rel $2 ;;
    *) usage ;;
esac
