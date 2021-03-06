#language: ru

@tree
@ОтчетОстатки

Функционал: Отчет Остатки

Как Тестировщик я хочу
сформировать отчет отстатки под основной настройкой и сравнить его с макетным
чтобы корретно посмотреть товары на складах 

Контекст: 
	
	Дано я подключаю профиль TestClient "Этот клиент"
	

Сценарий: _0201 Загрузка данных расхода и прихода 
	Когда _0002 Экспорт Документы движения РН Товарные запасы 


Сценарий: _0202 проведение 
	И я выполняю код встроенного языка на сервере
			|'Документы.РасходТовара.НайтиПоНомеру("000000008").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
			|'Документы.РасходТовара.НайтиПоНомеру("000000011").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
			|'Документы.РасходТовара.НайтиПоНомеру("000000016").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
			|'Документы.РасходТовара.НайтиПоНомеру("000000017").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
			|'Документы.ПриходТовара.НайтиПоНомеру("000000041").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|


Сценарий: _0203 Сравнение с макетом 
	Дано Я открываю навигационную ссылку "e1cib/app/Отчет.ОстаткиТоваровНаСкладах"
	И я нажимаю на кнопку с именем 'ФормаЗагрузитьВариант'

	И в таблице "СписокНастроек" я выбираю текущую строку
	И Пауза 5	
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	Тогда Табличный документ "Результат" равен макету "Отчет Остатки"
