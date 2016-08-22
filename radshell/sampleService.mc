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

dnl Так комментируем одну строку

ifelse(
	Так можно комментировать несколько строк.
	Если внутри есть скобка то к ней обязательно должна быть пара.
	Не должно быть запятых.
)


ifelse(
	Можно задать такую запись (это синтаксис m4)
	для того чтобы не использовать длинные
	имена сервисов много раз
	или задать переменную
)

define(`_shortName',`Very_Long_Name_Other_Service')dnl

# Ещё пример использования define
# Вставляет зону ответсвенности, там где его укажешь

define(`__RESP',`USER_INST(RESPONSIBLE,Нижегородский ИВЦ)dnl')

# Можно использовать предопределенные define при задании шаблонов
# Описаны в файле define/def_templ.mc
# Там сразу указана связка Шаблона и его аттрибутов.

_template_AlertKey

# аналогична записи
ifelse(
TEMPL_NAME(rzd_OS_EIF_AlertKey)
TEMPL_ATTR(statusTask,AlertKey,Node)
)


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

SERVICE(_shortName,Сервис Важный,Сервис с очень длинным именем)dnl

dnl Разные варианты использования VALUES

SERVICE(rzd_Values_Test,Разные значения,Здесь будет разный синтаксис)dnl
dnl Можно не писать имя сервиса. Имя берется из последнего SERVICE
VALUES(ITMSRV32,icmp_critical,rzd-server-01)dnl
VALUES(2,ITMSRV32,icmp_warning,rzd-server-02)dnl
VALUES(rzd_Values_Test,3,ITMSRV32,icmp_major,rzd-server-03)dnl


SERVICE(rzd_Sample_Service,Пример сервиса,Сервис создан средствами m4)dnl

dnl Если надо использовать '"' в именах, используем '\' см. ниже
SERVICE(rzd_Sample_Parent,Пример сервиса отца,Сервис создан средствами \"m4\")dnl

SERVICE(rzd_Sample_Child1,Пример сервиса ребёнка 1,Сервис создан средствами m4)dnl
SERVICE(rzd_Sample_Child2,Пример сервиса ребёнка 2,Сервис создан средствами m4)dnl
SERVICE(rzd_Sample_Service_Attr,Сервис с атрибутами,Создан by m4)dnl
VALUES(rzd_Sample_Service_Attr,orw-ping-01,icmp_critical,orw-server-02)dnl
VALUES(rzd_Sample_Service_Attr,2,orw-ping-01,icmp_critical,orw-server-03)dnl
VALUES(rzd_Sample_Service_Attr,3,orw-ping-01,icmp_critical,orw-server-04)dnl
USER_INST(rzd_Sample_Service_Attr,RESPONSIBLE,Калинградский ИВЦ)dnl

dnl Здесь пример с сокращением имени сервиса, т.е. для повторяющегося имени сервиса
dnl его можно опустить

SERVICE(rzd_Miss_Service,Default Name,Имя при создании атрибутов пропускаем)dnl
VALUES(ping,icmp_citical,server-01)dnl
VALUES(2,ping,icmp_warning,server-02)dnl
USER_INST(RESPONSIBLE,С-Пб ИВЦ)dnl

dnl Пример как задействовать два шаблона с атрибутами и значениями
divert(-1)
# Это первый атрибут со значениями
TEMPL_NAME(rzd_Attr_1)
TEMPL_ATTR(statusServer,Node)
TEMPL_SERV(rzd_Attr_1,rzd_Attr_2)
divert(5)dnl
dnl Создаем сам сервис
SERVICE(rzd_Service_Attr2,Service,Сервис с двумя шаблонами)dnl
VALUES(orw-host-01)dnl

divert(-1)
# Это второй атрибут со значениями
# 0 в VALUES говорит о том, что не надо сбрасывать пары атрибутов
TEMPL_NAME(rzd_Attr_2)
TEMPL_ATTR(statusAlertKey,AlertKey)
divert(5)dnl
VALUES(0,ICMP_FAIL)dnl
VALUES(2,ICMP_WARNING)dnl
dnl Здесь будет использоваться имя сервиса из последнего макроса SERVICE
dnl поэтому его не указываем (rzd_Service_Attr2)




divert(7)
PARENT(rzd_Sample_Parent)dnl
CHILD(rzd_Child_0)dnl
CHILD(rzd_Sample_Child1,rzd_Sample_Child2,Child3,Child4,Child5)dnl
