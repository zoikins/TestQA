﻿#language: ru

@tree
@Отчеты

Функционал: Тестирование отчетов

Как тестировщик я хочу
протестировать отчеты
чтобы проверить что у пользователя не возникнет проблем


контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _0901 подготовительный сценаотй 
	когда экспорт основных данных
	когда экспорт документов закупок
	И я выполняю код встроенного языка на сервере
		|'Документы.PurchaseOrder.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.PurchaseOrder.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.PurchaseOrder.НайтиПоНомеру(3).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.PurchaseInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.PurchaseInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	
Сценарий: _0901 
	Дано Я открываю навигационную ссылку "e1cib/app/Report.D0010_ItemsInfo"
	И я нажимаю на кнопку с именем 'FormGenerate'
	Дано табличный документ "Result" равен макету "информация по товарам 1" по шаблону



сценарий: _0902
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/app/Report.D1001_Purchases"
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе "Result" заполнится ячейка "R21C4" в течение 20 секунд
	

	
			