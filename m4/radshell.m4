divert(-1)
# Common functions
# and variable

define(`PARENT',`define(`PARENT',`$1')')

# Common construction
# foreach(x, (item_1, item_2, ..., item_n), stmt)
define(`foreach', `pushdef(`$1', `')_foreach(`$1', `$2', `$3')popdef(`$1')')
define(`_arg1', `$1')
define(`_foreach',
	`ifelse(`$2', `()', ,
		`define(`$1', _arg1$2)$3`'_foreach(`$1', (shift$2), `$3')')')

#
# Create fields with name attribute
# Macros: TEMPL_ATTR(<ruleName>,<Name attr>,<Name attr>...)
# Ex.
# field_1 Node
# field_2 AlertKey
# field_3 Summary
#
define(`_FIELDS',
`define(field_$2,$1)
 define(`CNT',$2)')

define(`FIELDS',`ifelse($#,0,,$1,`',,
`_FIELDS($1,incr(CNT))
	ifelse($#,1,,`FIELDS(shift($@))')')
')


include(../service/service.m4)
include(../template/template.m4)
