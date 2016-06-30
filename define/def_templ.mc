divert(-1)

# Link template and attributes
# Will fill due to working

define(`_template_AlertKey',`
TEMPL_NAME(rzd_OS_EIF_AlertKey)
TEMPL_ATTR(statusTask,AlertKey,Node)
')

define(`_template_Dis',`
TEMPL_NAME(rzd_OS_EIF_Dis)
TEMPL_ATTR(statusDisplayItem,ITMDisplayItem,Node)
')

define(`_template_AlertKey_noBad',`
TEMPL_NAME(rzd_OS_EIF_AlertKey_noBad)
TEMPL_ATTR(statusWarn,AlertKey,Node)
')

define(`_template_AlertKey_Bad',`
TEMPL_NAME(rzd_OS_EIF_AlertKey_Bad)
TEMPL_ATTR(statusCritical,AlertKey,Node)
')

define(`_template_AlertKey_Display',`
TEMPL_NAME(rzd_OS_EIF_AlertKey_Display)
TEMPL_ATTR(statusApplSys,AlertKey,ITMDisplayItem,Node)
')

define(`_template_BSMIdentity',`
TEMPL_NAME(rzd_OS_EIF_BSMIdentity)
TEMPL_ATTR(statusBSM,AlertKey,BSM_Identity)
')

define(`_template_OnlyAK',`
TEMPL_NAME(rzd_OS_EIF_onlyAK)
TEMPL_ATTR(statusEIFAK,AlertKey)
')

define(`_template_EP_ITNM',`
TEMPL_NAME(rzd_EndPoint_ITNM)
TEMPL_ATTR(statusPingITNM,EventID,NodeAlias)
')

define(`_template_Sys_LZ',`
TEMPL_NAME(rzd_System_LZ)
TEMPL_ATTR(statusNode,Node)
')
