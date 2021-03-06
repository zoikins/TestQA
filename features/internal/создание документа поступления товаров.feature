#language: ru
@Закупки

Функционал: создание документа поступления товаров

Как менеджер по закупкам  я хочу
документ поступления товаров 
чтобы поставить товар на учет 

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
Сценарий: создание документа Поступление товара
* открытие документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	//создание документа 
* заполнение шапки документа
	Тогда открылось окно 'Поступление товара (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	тогда элемент формы с именем "Склад" стал равен 'Малый'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И я нажимаю кнопку выбора у поля с именем "Поставщик"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000012' | 'Мосхлеб ОАО'  |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление товара (создание) *'
	и я нажимаю на кнопку "записать"
	и я запоминаю значение поля "номер" как "$Номер$"
* заполнение строки 
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'то'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыСумма"
	И в таблице "Товары" я завершаю редактирование строки
	Тогда таблица "Товары" содержит строки:
		| 'N' | 'Товар' | 'Цена'   | 'Артикул' | 'Количество' | 'Сумма'    |
		| '1' | 'Торт ' | '150,00' | 'Т78'     | '15,00'      | '1 500,00' |
* проведение документа 	
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* проверка создания документа
	И в таблице "Список" я перехожу к строке:
		| 'номер'   |
		| '$Номер$' |
* проверка существования элемента 
	И В командном интерфейсе я выбираю 'Продажи' 'Товары'
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	Тогда таблица "Список" содержит строки:
		| 'Наименование' |
		| 'Торт'    |
	
