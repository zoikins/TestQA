#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект> 

//Сценарий: тест веб сервиса
//
//И в поле с именем 'ПроверитьГод' я ввожу текст '2012'
//И Я запоминаю в переменную "СоединениеУстановлено" значение "Нет"
//и я делаю 2 раз
//	попытка
//		И я нажимаю на кнопку с именем 'ФормаПолучитьДанные'
//		И элемент формы с именем 'ГодВысокосный' стал равен 'Да'
//		И Я запоминаю в переменную "СоединениеУстановлено" значение "Да"
//		Тогда я прерываю цикл
//	Исключение 
//		и пауза 10 
//
//
//Если переменная "СоединениеУстановлено" имеет значение "Нет" Тогда
//	Затем я останавливаю выполнение сценария "Skipped"
//И В командном интерфейсе я выбираю 'Склад' 'Склады'
		
	
	сценарий: тест 
	попытка
		И Я подключаю клиент тестирования "ИмяКлиентаТестирования" из таблицы клиентов тестирования
	исключение
		И я регистрирую ошибку "Первая ошибка" по данным исключения

	и пауза 2	
		
	попытка
		И Я подключаю клиент тестирования "ИмяКлиента2Тестирования" из таблицы клиентов тестирования
	исключение
		И я регистрирую ошибку "Вторая ошибка" по данным исключения	

