#language: ru

@tree

Функционал: создание элементов справочника номенклатуры в цикле 

Как тестировщик я хочу
создать 10 элементов справочника номенклатуры 
чтобы попробовать работу цикла 


Сценарий: создание большого объема данных - нагрузочное тестирование (номенклатуры )
	и я запоминаю значение выражения '1' в переменную "Шаг"
	и я делаю 10 раз 	
		и я запоминаю значение выражения '$Шаг$+1' в переменную "Шаг"
		и я запоминаю значение выражения '"Номенклатура Авто"+$Шаг$' в переменную "НаименованиеНоменклатуры"
		и я запоминаю значение выражения '{"e1cib/data/Catalog.Items?ref="+StrReplace(New UUID,"-","")}' в переменную "НовыйUUID"

		И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'         | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor'                                                           | 'ItemID' | 'PackageUnit' | 'Description_en'           | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '$НовыйUUID$' | 'False'        |   ''     | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | '58792'  | ''            | '$НаименованиеНоменклатуры$' | ''                 | ''               | ''               |          |          |          |          |         |

		И я перезаполняю для объекта табличную часть "AddAttributes":
		| 'Ref'         | 'Property'                                                                                           | 'Value'                                                                                 |
		| '$НовыйUUID$' | 'e1cib/data/ChartOfCharacteristicTypes.AddAttributeAndProperty?ref=b762b13668d0905011eb766bf96b275d' | 'e1cib/data/Catalog.AddAttributeAndPropertyValues?ref=b762b13668d0905011eb766bf96b2761' |


