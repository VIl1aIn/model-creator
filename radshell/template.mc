divert(-1)

#####################
# Model service:
#####################

# Description:

# Date:

# version:

# init section
# Nodes, Situations etc

#define(`',`')


# List predefine template
#_template_AlertKey (AlertKey,Node)
#_template_Dis (ITMDisplayItem,Node)
#_template_AlertKey_noBad (AlertKey,Node)
#_template_AlertKey_Bad (AlertKey,Node)
#_template_AlertKey_Display (AlertKey,ITMDisplayItem,Node)
#_template_BSMIdentity (AlertKey,BSM_Identity)
#_template_OnlyAK (AlertKey)
#_template_EP_ITNM (EventID,NodeAlias)
#_template_Sys_LZ (Node)
#_template_Sys_NT (Node)
#_template_Sys_UX (Node)

# Responsible define
define(`__RESP',`USER_INST(RESPONSIBLE,Зона ответвенности за приложение)dnl')
#define(`__RESP_SYS',`USER_INST(RESPONSIBLE,Зона ответственности за системную часть)dnl')


divert(5)dnl
# Service section
SERVICE()dnl


divert(7)dnl
# Relations section
PARENT()dnl
CHILD()dnl
