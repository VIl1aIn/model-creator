divert(-1)
#
# Macros for create and set template
#
# divert(2)

# For attrib and one template
define(`TEMPL_NAME',`define(`TEMPL_NME',`$1')')
define(`TEMPL_ATTR',`
	define(`ruleName',$1)
	define(`CNT',0)
	define(`CtrlNum',`$#')
	FIELDS(shift($@))
')dnl

define(`TEMPL_SERV',`define(`TMPL_SRV',`"$1"foreach(`t',(shift($*)),`,"t"')')')dnl


define(`TEMPLATE',`define(`TEMPL_NME',`$1')
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

define(`USER_ATTR',`addUserPreferencesForTemplate(
"TEMPL_NME",
"$1",
"$2",
);
'
)

define(`NUM_FORMULA',`addInternalAttributeToTemplate(
"TEMPL_NME"
"$1",
"$2",
ifelse($3,,null,"$3"),
ifelse($4,,null,"$4"),
ifelse($5,,null,"$5"),
ifelse($6,,null,"$6")
);
'
)

define(`WORST_DEP',`addWorstChildDependencyAttributeToTemplate(
"TEMPL_NME",
"$1",
"$2",
"$3",
"$4",
ifelse($5,,false,true)
);
'
)

define(`RULE_DESCR',`define(`RULE_NME',`$1')
addUserPreferencesForTemplate(
"TEMPL_NME",
"RuleDisplayName_$1",
"$2"
);

addUserPreferencesForTemplate(
"TEMPL_NME",
"RuleDescription_$1",
"$3"
);
'
)

define(`POLCNA_DEP',`addPolicyDependencyAttributeToTemplate(
"TEMPL_NME",
"$1",
"OverallAttribute",
"RULE_NME",
"PolicyAttribute_`'TEMPL_NME`'_`'RULE_NME`'1",
"/* $2 */ENDLINEStatus = 0; // initialize Status varENDLINENumericAttributeFunctions.$2(ChildrenStatusArray, AllChildrenArray, ServiceInstance, Status);ENDLINE", 
false
);
'
)

define(`SET_STATUS',`addInternalAttributeToTemplate(
"TEMPL_NME",
"RULE_NME`'_Status",
"RULE_NME.Value",
"DontTestFormula",
null,
"$2",
"$1",
false
);
'
)

define(`FUNCNA_DEP',`add$2DependencyAttributeToTemplate(
"TEMPL_NME", 
"$1", 
"OverallAttribute", 
"RULE_NME"
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
