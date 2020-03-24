#Область ПрограммныйИнтерфейс

#Область Потоки

// Дополняет коллекцию элементом, значением которого является текст прочитанный из потока.
// 
// Параметры:
// 	Поток - Поток - поток из которого необходимо прочитать текст;
// 	Ключ - Строка - ключ элемента;
// 	Коллекция - Структура, Соответствие - коллекция, в которую добавляется элемент с текстом;
//			
// @UnitTest
Процедура ДополнитьКоллекциюТекстомИзПотока(Знач Поток, Знач Ключ, Коллекция) Экспорт
	
	Перем ИсходныйТекст;
	Перем ЧтениеТекста;

	Попытка
		
		Поток.Перейти( 0, ПозицияВПотоке.Начало );
		ЧтениеТекста = Новый ЧтениеТекста( Поток, КодировкаТекста.UTF8 );
		ИсходныйТекст = ЧтениеТекста.Прочитать();
		Коллекция.Вставить( Ключ, ИсходныйТекст );
		
	Исключение

		ЧтениеТекста.Закрыть();
		ВызватьИсключение;

	КонецПопытки;
	
	ЧтениеТекста.Закрыть();
	
КонецПроцедуры


// TODO актуально?


// Преобразует поток данных в коллекцию через чтение этого потока как текста в формате JSON.
// 
// Параметры:
// 	Поток - Поток - поток с данными;
// 	ЭтоСоответствие - Булево - если Истина, то JSON будет преобразован в Соответствие, если Ложь, то в Структуру;
// 	ДобавлятьИсточник - Булево - если Истина, то в коллекцию по ключу "json" добавляется элемент
// 		с текстом в формате JSON, полученным из потока;
// 	Коллекция - Неопределено, Соответствие, Структура - (исходящий параметр),
//	 	данные полученные путем преобразования текстовых данных из формата JSON в коллекцию;
//			
// @tested
Процедура ПотокВКоллекциюКакJSON(Знач Поток, Знач ЭтоСоответствие = Ложь, Знач ДобавлятьИсточник = Ложь,
				Коллекция = Неопределено) Экспорт
	
	Перем ЧтениеJSON;
	
	ЧтениеJSON = Новый ЧтениеJSON;
	
	Попытка
		
		Поток.Перейти( 0, ПозицияВПотоке.Начало );
		ЧтениеJSON.ОткрытьПоток( Поток, КодировкаТекста.UTF8 );
		Коллекция = ПрочитатьJSON( ЧтениеJSON, ЭтоСоответствие );
		Если ( ДобавлятьИсточник ) Тогда
			ОбщегоНазначения.ДополнитьКоллекциюТекстомИзПотока( Поток, "json", Коллекция );
		КонецЕсли;
		
	Исключение
		
		ЧтениеJSON.Закрыть();
		ВызватьИсключение;
		
	КонецПопытки;
	
	ЧтениеJSON.Закрыть();
	
КонецПроцедуры

#КонецОбласти 


#Область Метаданные

// Определяет принадлежность объекта метаданных к общему типу "Справочник".
//
// Параметры:
//  ОбъектМетаданных - ОбъектМетаданных - объект, для которого необходимо определить принадлежность к заданному типу.
// 
// Возвращаемое значение:
//   Булево - Истина, если объект является справочником.
//
Функция ЭтоСправочник(ОбъектМетаданных) Экспорт
	
	Возврат Метаданные.Справочники.Содержит(ОбъектМетаданных);
	
КонецФункции

#КонецОбласти

#КонецОбласти