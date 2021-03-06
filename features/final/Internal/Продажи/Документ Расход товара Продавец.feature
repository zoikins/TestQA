#language: ru

@tree

Функционал:		Документ Расход товара Продавец

Как Продавец я хочу
 создать документ, изменить существующий , записать , пометить на удаление , снять пометку на удаление 
чтобы контролировать ввод расхода товара   

Контекст: 
//	Дано я закрываю сеанс текущего клиента тестирования
	Дано я подключаю TestClient "Продавец" логин "Продавец" пароль ""

Сценарий: _0401 Документ Расход товара Продавец
	когда _0003 Экспорт Документа Расход Товара

Сценарий: _0402Документ Расход товара Продавец

	Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"

* создание и заполнение документа 
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Мосхлеб ОАО'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Строящийся склад'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000038' | 'Ремонт'       |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '100,00'
	И в таблице "Товары" я завершаю редактирование строки

* редактирование существующего в форме документа 
	Дано Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=bbf30050ba5c887711e1fe6190994fe1"
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я нажимаю на кнопку с именем 'ФормаПровести'
	И я нажимаю на кнопку с именем 'ФормаОтменаПроведения'
	И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
	И я нажимаю на кнопку с именем 'Button0'
	И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
	И я нажимаю на кнопку с именем 'Button0'
	И я нажимаю на кнопку с именем 'ФормаПровести'

* редактирование существующего в форме списка 
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	
	И в таблице "Список" я перехожу к строке:
		| 'Номер'     |
		| '000000016' |

	И я нажимаю на кнопку с именем 'ФормаОтменаПроведения'
	И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
	И я нажимаю на кнопку с именем 'Button0'
	И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
	И я нажимаю на кнопку с именем 'Button0'
	И я нажимаю на кнопку с именем 'ФормаПровести'
			

