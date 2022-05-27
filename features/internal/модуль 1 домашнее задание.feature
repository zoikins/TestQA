﻿#language: ru

@tree

Функционал: проверка расчета итоговой суммы документа Заказ 

Как Администратор я хочу
Открыть документ заказ, ввести строку в таблицу товары , заполнить строку - проверить сумму,
изменить цену проверить сумму, изменить количество проверить сумму 
чтобы корректно считалась сумма документа , также проверить на невозможность ввода количества в услуге
Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий 
Сценарий: проверка суммы документа 
* создание документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* заполнение таблицы
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Торт '
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '300,00'
	И в таблице "Товары" я завершаю редактирование строки
	И у элемента "Сумма (итог)" я жду значения "300" 
* изменение цены 
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '400,00'
	И в таблице "Товары" я завершаю редактирование строки
	И у элемента "Сумма (итог)" я жду значения "400" 
* изменение количества
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И в таблице "Товары" я завершаю редактирование строки
	И у элемента "Сумма (итог)" я жду значения "800" 

Сценарий: Заполнение количества у услуги в таблице товаров 

* создание документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* добавление количества у товара 
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Торт '
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '100,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
		
* добавление количества у услуги	
	И в таблице "Товары" я активизирую поле с именем "ТоварыТовар"
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Доставка'
	Когда Проверяю шаги на Исключение:
	|'И в таблице "Товары" в поле с именем "ТоварыКоличество" я ввожу текст "2"'|
