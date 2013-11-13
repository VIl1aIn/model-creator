divert(-1)dnl
#
# Macros for create and set template
#
# divert(2)


define(`TEMPL_NAME',`define(`TEMPL_NAME',`$1')')
define(`TEMPL_ATTR',`
	define(`ruleName',$1)
	define(`CNT',0)
	FIELDS(shift($@))
')dnl


define(`TEMPLATE',`define(`TEMPL_NAME',`$1')
createTemplate(
"$1", 
"cloud_svg.gif"
);

setTemplateDescription(
"$1", 
"$2"
);
'
)


ifelse(
addNewRawAttribute(
"rzd_OS", 
"rulesStatusOS", 
new String[] { "TME10tecad(6601)" }, 
new String[] { "AlertKey" }, 
0, 
"ObjectServer"
);

addRawAttributeThresholdSet(
"rzd_OS", 
"rulesStatusOS", 
"Bad", 
null, 
new String[] { "Severity" }, 
new String[] { ">=" }, 
new String[] { "5" }, 
0
);

addRawAttributeThresholdSet(
"rzd_OS", 
"rulesStatusOS", 
"Marginal", 
null, 
new String[] { "Severity" }, 
new String[] { ">=" }, 
new String[] { "2" }, 
0
);

)


ifelse(
addWorstChildDependencyAttributeToTemplate(
"rzd_Region", 
"rzd_complex_Express", 
"worstComplex", 
"Bad", 
"Marginal", 
false
);
)
