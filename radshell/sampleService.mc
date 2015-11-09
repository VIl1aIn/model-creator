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

# Макрос указывает, что сервисы будут создаваться с привязкой на
# несколько шаблонов

TEMPL_SERV(rzd_Template_1,rzd_Template_2,rzd_Template_Value)dnl

ifelse(
	Можно задать такую запись (это синтаксис m4)
	для того чтобы не использовать длинные
	имена сервисов много раз
)

define(`_shortName',`Very_Long_Name_Other_Service')dnl

divert(2)dnl
dnl Здесь пример как создать шаблоны для Numerical Aggregation
dnl с использованием функции из политики

dnl Создаем шаблон
TEMPLATE(rzd_Templ_Parent,Родитель для NumAgg правила)dnl

divert(3)dnl Можно в том же потоке (2), если идет следом
dnl Создаем описание правила (name,Display,Description)
RULE_DESCR(worstNumAgg,worstNumAgg,Worst Numerical Aggregation)dnl
dnl Создаем зависимость для policy rule
POLCNA_DEP(rzd_Templ_Child,policyFunction)dnl
dnl Задаем статусы, если нужно (Marginal,Critical)
SET_STATUS(3,5)dnl
dnl Создаем зависимость Min (Max,Sum)
RULE_DESCR(worstMin,worstMinimum,Worst Numerical Aggregation Minimum)dnl
FUNCNA_DEP(rzd_Templ_Child_Min,Min)dnl


divert(2)dnl
TEMPLATE(rzd_Template_New,Это шаблон из m4)dnl

divert(3)dnl
USER_ATTR(responsible,Петербургский ИВЦ)dnl
USER_ATTR(level,no)dnl
NUM_FORMULA(numStatus,Int(statusNode.Value*addAttr.Value),,,20,30)dnl

divert(4)dnl
WORST_DEP(childTempl_1,worstChild-1,Bad,Marginal,isChildInstancePropagation)dnl
WORST_DEP(childTempl_2,worstChild-2,Bad,Marginal)dnl




divert(5)dnl

dnl Так комментируем одну строку

SERVICE(_shortName,Сервис Важный,Сервис с очень длинным именем)dnl

SERVICE(rzd_Sample_Service,Пример сервиса,Сервис создан средствами m4)dnl

dnl Если надо использовать '"' в именах, используем '\' см. ниже
SERVICE(rzd_Sample_Parent,Пример сервиса отца,Сервис создан средствами \"m4\")dnl

SERVICE(rzd_Sample_Child1,Пример сервиса ребёнка 1,Сервис создан средствами m4)dnl
SERVICE(rzd_Sample_Child2,Пример сервиса ребёнка 2,Сервис создан средствами m4)dnl
SERVICE(rzd_Sample_Service_Attr,Сервис с атрибутами,Создан by m4)dnl
VALUES(rzd_Sample_Service_Attr,orw-ping-01,icmp_critical,orw-server-02)dnl
VALUES_NEXT(rzd_Sample_Service_Attr,2,orw-ping-01,icmp_critical,orw-server-03)dnl
VALUES_NEXT(rzd_Sample_Service_Attr,3,orw-ping-01,icmp_critical,orw-server-04)dnl
USER_INST(rzd_Sample_Service_Attr,RESPONSIBLE,Калинградский ИВЦ)dnl

ifelse(
А так можно
комментировать
несколько строк
)

divert(7)
PARENT(rzd_Sample_Parent)dnl
CHILD(rzd_Child_0)dnl
CHILD(rzd_Sample_Child1,rzd_Sample_Child2,Child3,Child4,Child5)dnl
