﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект> 

//Сценарий: изменение количества во всех строках таблицы
//	И для каждой строки таблицы "ItemList" я выполняю используя колонку "N"
//		И в таблице "ItemList" в поле "Количество" я ввожу текст "99,000"      |
		
//Сценарий: удаление строк таблицы
//	И пока в таблице "ItemList" количество строк ">" 0 Тогда
//		И в таблице "ItemList" я удаляю строку
		


//Сценарий: изменение видда цен по условиям
//	И для каждой строки таблицы "ItemList" я выполняю	
//		Если таблица "ItemList" содержит строки тогда:
//				| 'Номенклатура'             | 'Характеристика' | 'Вид цены'          |
//				| 'Товар с характеристиками' | 'S/Красный'      | 'Цена поставщика 1' |
//				И в таблице "ItemList" я перехожу к строке 
//				| 'Номенклатура'             | 'Характеристика' | 'Вид цены'          |
//				| 'Товар с характеристиками' | 'S/Красный'      | 'Цена поставщика 1' |
//				И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListPriceType"
//				Тогда открылось окно 'Виды цен'
//				И в таблице "List" я перехожу к строке:
//					| 'Валюта' | 'Код' | 'Наименование'      | 'Ссылка'            |
//					| 'USD'    | '4'   | 'Цена поставщика 2' | 'Цена поставщика 2' |
//				И в таблице "List" я выбираю текущую строку
//	и таблица "ItemList" не содержит строки:
//			| 'Номенклатура'             | 'Характеристика' | 'Вид цены'          |
//			| 'Товар с характеристиками' | 'S/Красный'      | 'Цена поставщика 2' |
						
				
//Сценарий: перебор элемента справочника номенклатура
//	И для каждой строки таблицы 'List' я выполняю
//		И в таблице "List" я выбираю текущую строку
//		Тогда не появилось окно предупреждения системы
//		И я закрываю текущее окно
		
		
Сценарий: создание большого объема данных - нагрузочное тестирование (спр единицы номенклатуры )
	и я запоминаю значение выражения '1' в переменную "Шаг"
	и я делаю 10 раз 	
		и я запоминаю значение выражения '$Шаг$+1' в переменную "Шаг"
		и я запоминаю значение выражения '"Ед.изм."+$Шаг$' в переменную "ЕдиницаИзмерения"
		И я проверяю или создаю для справочника "Units" объекты:
		| 'Ref'                                                           | 'DeletionMark' | 'Code' | 'Item' | 'Quantity' | 'BasisUnit' | 'UOM' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '{"e1cib/data/Catalog.Units?ref="+StrReplace(New UUID,"-","")}' | 'False'        |       | ''     | 1          | ''          | ''    | '$ЕдиницаИзмерения$'             | ''                 | ''               | ''               |          |          |          |          |         |

