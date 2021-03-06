#language: ru

@tree
@ТоварыФайлы

Функционал: Товары добавление внешних файлов

Как тестировщик я хочу
протестировать функцию доабления файлов в номенклатуру товар
чтобы у товара были картинки 
Контекст: 
	
	Дано я подключаю профиль TestClient "Этот клиент"

Сценарий: _0101 Подготовка
	когда _0001 Загрузка справочников

Сценарий: _0102 добавление файла и перевыбор
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/data/Справочник.Товары?ref=a9b000055d49b45e11db8c51bbb079af"
	И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"

	Если таблица "Список" содержит строки:  тогда
		| 'Наименование'     | 'Код'       |
		| 'itempicture1.png' | '000000018' |
				И в таблице "Список" я перехожу к строке:
					| 'Наименование'     | 'Код'       |
					| 'itempicture1.png' | '000000018' |
				И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюИзменить' на элементе формы с именем "Список"
				И я выбираю файл "$КаталогПроекта$\Files\itempicture1.png"
				И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна 'itempicture1.png (Файл)' в течение 20 секунд
	Иначе
			тогда 
				И я нажимаю на кнопку с именем 'ФормаСоздать'
				Тогда открылось окно 'Файл (создание)'
				И в поле с именем 'Наименование' я ввожу текст 'itempicture1.png'
				И я выбираю файл "$КаталогПроекта$\Files\itempicture1.png"
				И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна 'Новая картинка (Файл)' в течение 20 секунд
	
	@screenshot
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	@screenshot
	И я нажимаю на кнопку с именем 'ОбновитьКартинку'

	И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'     |
		| 'itempicture1.png' |
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
		
		
	
	