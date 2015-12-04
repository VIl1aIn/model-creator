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
define(`SRV_NAME',`$1')
')dnl

define(`_CHILD',`addServiceInstanceDependency(
"PRNT", 
"$1"
);

')dnl

define(`CHILD',`ifelse($#,0, ,$1,`', ,
	_CHILD($1)ifelse($#,1,,`CHILD(shift($@))'
))'
)dnl


# Parameters
# _ATTR(<Service Name>,<attr Number>,<Value>)
define(`_ATTR',
`addInstanceIDFieldValuePair(
"TEMPL_NME",
"ruleName",
"field_$2",
"$3",
ifdef(`recordNum',`ifelse(recordNum,0,`1',`recordNum')',`1'),
"$1"
);
define(`CNT',$2)dnl
')dnl



####### Это оставлено для совместимости с макросом VALUES_NEXT
#### Сейчас для всего используется VALUES
#### Когда все mc будут исправлены можно будет удалить
define(`VALUES_NEXT',
`define(`ChkF',`regexp($1,^[0-9]+$)')
ifelse($#,incr(CtrlNum),
	_VALUES_NEXT($@),
	$#,decr(CtrlNum),
	_VALUES_NEXT(SRV_NAME,1,$@),
	ChkF,-1,
	_VALUES_NEXT($1,1,shift($@)),
	_VALUES_NEXT(SRV_NAME,$@)
)'
)

###### Конец блока для удаления ##########



dnl VALUES([name service],[<N>],Attr,...)
define(`VALUES',
`define(`ChkF',`regexp($1,^[0-9]+$)')
ifelse($#,incr(CtrlNum),
	_VALUES_NEXT($@),
	$#,decr(CtrlNum),
	_VALUES_NEXT(SRV_NAME,1,$@),
	ChkF,-1,
	_VALUES_NEXT($1,1,shift($@)),
	_VALUES_NEXT(SRV_NAME,$@)
)'
)

dnl For several and next records into service
define(`_VALUES_NEXT',
`define(`CNT',0)define(`recordNum',`$2')
ifelse(`$2',`1',`
clearAllInstanceIDFieldValuePairs(
"$1"
);
')dnl

foreach(`FV',(shift(shift($@))),`_ATTR($1,incr(CNT),`FV')'
)
')dnl

dnl USER_INST([service name,]<Attr>,<Value>)
dnl
define(`USER_INST',`
ifelse($#,3,
	_USER_INST($@),
	_USER_INST(SRV_NAME,$@)
)
'
)

# _USER_INST(<Service>,<Attr>,<Value>)
#
define(`_USER_INST',`
addUserPreferencesForInstance(
"$1",
"$2",
"$3"
);
')dnl
