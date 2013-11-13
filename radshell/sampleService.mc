divert(-1)
# diverts:
# 0 - data fetcher
# 1 - policies
# 2 - template
# 3 - rules templ
# 4 - relations of template
# 5 - service
# 6 - attrib service
# 7 - relations of service
# 

# Service
# 1 - instance name
# 2 - display name
# 3 - description

# Sample file


TEMPL_NAME(rzd_Sample_Template)dnl
TEMPL_ATTR(statusNode,Node,AlertKey,Server)dnl

divert(2)
TEMPLATE(rzd_Template_New,Это шаблон из m4)dnl



divert(5)dnl


#SERVICE(rzd_Sample_Service,Пример сервиса,Сервис создан средствами m4)dnl
#SERVICE(rzd_Sample_Parent,Пример сервиса отца,Сервис создан средствами m4)dnl
#SERVICE(rzd_Sample_Child1,Пример сервиса ребёнка 1,Сервис создан средствами m4)dnl
#SERVICE(rzd_Sample_Child2,Пример сервиса ребёнка 2,Сервис создан средствами m4)dnl
SERVICE(rzd_Sample_Service_Attr,Сервис с атрибутами,Создан by m4)dnl
VALUES(rzd_Sample_Service_Attr,orw-ping-01,icmp_critical,orw-server-02)dnl
#divert(7)
#PARENT(rzd_Sample_Parent)dnl
#CHILD(rzd_Child_0)dnl
#CHILD(rzd_Sample_Child1,rzd_Sample_Child2,Child3,Child4,Child5)dnl
