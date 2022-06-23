﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект> 

Переменные: 
	ЗаголовокФормыСпискаПоступления = '{!Metadata.Documents.PurchaseInvoice.ListPresentation}'
	ЗаголовокПодсистемыЗакупок = '{!Metadata.Subsystems.PurchaseAP.Synonym}'
*ПроверяемыеЗначение
		| 'Имя'                       | 'Представление'               | 'Значение' |
		| 'СуммаДокументаПоступления' | 'Сумма документа поступления' | '900,00'    |
	
ИтоговаяСуммаОтчетаЗакупки = 'R21C3'
ШтрихкодНеНайден = '{!R().S_019}'

//Сценарий: Открытие формы списка поступние 
//	И В командном интерфейсе я выбираю "ЗаголовокПодсистемыЗакупок" "ЗаголовокФормыСпискаПоступления"
//	
//		
//Сценарий: проверка суммы документа посупления 		
//	И у элемента формы с именем 'ItemListTotalTotalAmount' текст редактирования стал равен 'ПроверяемыеЗначение.СуммаДокументаПоступления.Значение'
//
//Сценарий: проверка итоговой суммы отчета закупки 
//Когда В панели разделов я выбираю 'Розница'
//	И В командном интерфейсе я выбираю 'Отчеты' 'D1001 Закупки'
//	И я нажимаю на кнопку с именем 'FormGenerate'
//	И в табличном документе 'Result' я перехожу к ячейке "ИтоговаяСуммаОтчетаЗакупки"
//

Сценарий: проверка сообщения 
	и я запоминаю значение выражения 'StrTamplate($ШтрихкодНеНайден$,"123")' в переменную "ИмяПеременной2"
	Дано В последнем сообщении  TestClient есть строка "ИмяПеременной2"
	

