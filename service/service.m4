divert(-1)
# Create instance service function
#
# diverts:
# 0 - data fetcher
# 1 - policies
# 2 - template
# 3 - rules templ
# 4 - service
# 5 - attrib service
# 6 - relations


# Service
# 1 - instance name
# 2 - display name
# 3 - description

define(`SERVICE',`addServiceInstance(
new String[] { ifdef(`TMPL_SRV',`TMPL_SRV',`"TEMPL_NME"') },
"$1",
"$2",
"$3",
"Standard",
null,
null,
"REGULAR"
);

')dnl

define(`_CHILD',`addServiceInstanceDependency(
"PRNT", 
"$1"
);

')dnl

define(`CHILD',`ifelse($#,0, ,$1,`', ,
	_CHILD($1)ifelse($#,1,,`CHILD(shift($@))'
		)
	)'
)dnl


# Parameters
# _ATTR(<Service Name>,<attr Number>,<Value>)
define(`_ATTR',
`addInstanceIDFieldValuePair(
"TEMPL_NME",
"ruleName",
"field_$2",
"$3",
ifdef(`recordNum',`recordNum',`1'),
"$1"
);
define(`CNT',$2)dnl
')dnl

dnl For First and Single record

define(`VALUES',
`define(`CNT',0)undefine(`recordNum')
clearAllInstanceIDFieldValuePairs(
"$1"
);

foreach(`FV',(shift($@)),`_ATTR($1,incr(CNT),`FV')'
)
')dnl

dnl For several and next records into service

define(`VALUES_NEXT',
`define(`CNT',0)define(`recordNum',`$2')
ifelse(`$2',`1',`
clearAllInstanceIDFieldValuePairs(
"$1"
);
')dnl

foreach(`FV',(shift(shift($@))),`_ATTR($1,incr(CNT),`FV')'
)
')dnl

define(`USER_INST',`
addUserPreferencesForInstance(
"$1", 
"$2", 
"$3"
);
')dnl
