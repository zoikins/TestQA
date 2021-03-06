#language: ru

@tree

Функционал: заказ поставщику 

Как менеджер  я хочу
зафиксировать заказанный поставщику товар 
чтобы проанализировать разницу между тем что было заказано и что было фактичеки доставлено

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
	
Сценарий: _0401 подготовительный сценарий 
	когда экспорт основных данных

Сценарий: _0402 проверка заполнения цены без соглашения
	* Заполнение документа заказ поставщику
		Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseOrder"
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Заказ поставщику (создание)'
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Когда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'       |
			| '3'   | 'Поставщик 1 (1 соглашение)' |
	
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
		И в таблице "ItemList" я активизирую поле с именем "ItemListItem"
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListItem"
		Тогда открылось окно 'Номенклатура'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            | 'Ссылка'                  |
			| '2'   | 'Товар без характеристик' | 'Товар без характеристик' |
		И в таблице "List" я выбираю текущую строку
		и в таблице "ItemList" я завершаю редактирование строки
	*проверка заполнения цены из соглашения 
		Тогда таблица "ItemList" стала равной:
			| 'N' | 'Номенклатура'            | 'Характеристика'          | 'Количество' | 'Ед. изм.' | 'Вид цены'          | 'Цена'   |
			| '1' | 'Товар без характеристик' | 'Товар без характеристик' | '1,000'      | 'шт'       | 'Цена поставщика 1' | '150,00' |
	* изменение цены и проверка его перезаполнения при перевыборе соглашения 	
		И в таблице "ItemList" я выбираю текущую строку
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListPriceType"
		Тогда открылось окно 'Виды цен'
		И в таблице "List" я перехожу к строке:
			| 'Валюта' | 'Код' | 'Наименование'      | 'Ссылка'            |
			| 'USD'    | '4'   | 'Цена поставщика 2' | 'Цена поставщика 2' |
		И в таблице "List" я выбираю текущую строку
		Тогда таблица "ItemList" стала равной:
			| 'N' | 'Номенклатура'            | 'Характеристика'          | 'Количество' | 'Ед. изм.' | 'Вид цены'          | 'Цена' |
			| '1' | 'Товар без характеристик' | 'Товар без характеристик' | '1,000'      | 'шт'       | 'Цена поставщика 2' | ''     |

		И я нажимаю кнопку выбора у поля с именем "Agreement"
		Тогда открылось окно 'Соглашения'
		
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'               | 'Вид'     | 'Вид взаиморасчетов' |
			| '6'   | 'Соглашение с поставщиком 1' | 'Обычное' | 'По соглашениям'     |
		
				
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Табличная часть товаров будет обновлена'
		И я нажимаю на кнопку с именем 'FormOK'
		Тогда таблица "ItemList" стала равной:
			| 'N' | 'Номенклатура'            | 'Характеристика'          | 'Количество' | 'Ед. изм.' | 'Вид цены'          | 'Цена'   |
			| '1' | 'Товар без характеристик' | 'Товар без характеристик' | '1,000'      | 'шт'       | 'Цена поставщика 1' | '150,00' |			
		И я закрываю все окна клиентского приложения
			

//Сценарий: Тест 
//	И я закрываю все окна клиентского приложения
//	* Заполнение документа заказ поставщику
//		Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseOrder"
//		И я нажимаю на кнопку с именем 'FormCreate'
//		Тогда открылось окно 'Заказ поставщику (создание)'
//		И я нажимаю кнопку выбора у поля с именем "Partner"
//		Когда открылось окно 'Партнеры'
//		И в таблице "List" я перехожу к строке:
//			| 'Код' | 'Наименование'       |
//			| '3'   | 'Поставщик 1 (1 соглашение)' |
//	
//		И в таблице "List" я выбираю текущую строку
//		И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
//
//		И я нажимаю сочетание клавиш "Enter"
//		И в таблице "ItemList" из выпадающего списка с именем "ItemListItem" я выбираю по строке 'товар без характеристик'
//		И я нажимаю сочетание клавиш "F9"
//		и в таблице "ItemList" я перехожу к следующей ячейке				
//		И в таблице "ItemList" я устанавливаю флаг "отмена"
//		И Проверяю шаги на Исключение:
//				|'И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListItem"'|
//		Когда открылось окно 'Заказ поставщику * от * *'
//		И в таблице "ItemList" я перехожу к строке:
//			| 'N' | 'Вид цены'          | 'Ед. изм.' | 'Количество' | 'НДС' | 'Не рассчитывать строки' | 'Номенклатура'            | 'Общая сумма' | 'Отмена' | 'Склад'                         | 'Сумма без налогов' | 'Сумма налогов' | 'Характеристика'          | 'Цена'   |
//			| '1' | 'Цена поставщика 1' | 'шт'       | '1,000'      | '20%' | 'Нет'                    | 'Товар без характеристик' | '150,00'      | 'Нет'    | 'Склад 1 (с контролем остатка)' | '125,00'            | '25,00'         | 'Товар без характеристик' | '150,00' |
//		И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListSortListDesc'
//						
//
//		И в таблице "List" текущего окна я устанавливаю сортировку по колонке "Partner" по возрастанию (расширение)
//												
//		И таблица "List" содержит строки из макета "заказыПоставщикуМакет"
													