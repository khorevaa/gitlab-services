////////////////////////////////////////////////////////////////////////////////
//
// Логирование.
//  
////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// Возвращает дополнительные параметры и данные для записи в лог.
// 
// Возвращаемое значение:
// 	Структура - описание:
// * HTTPОтвет - HTTPОтвет - HTTP-ответ сервера, к которому производился запрос;
// * HTTPСервисОтвет - HTTPСервисОтвет - HTTP-ответ веб-сервиса;
// * Объект - ЛюбаяСсылка - ссылка на объект, метаданные которого необходимо добавить в лог;
Функция ДополнительныеДанные() Экспорт

	Результат = Новый Структура;
	Результат.Вставить( "Объект");
	Результат.Вставить( "HTTPСервисОтвет");
	Результат.Вставить( "HTTPОтвет");

	Возврат Результат;

КонецФункции

// Логирует информационное событие. Если в дополнительных данных передать HTTPОтвет или HTTPСервисОтвет, то в событие
// логируемого сообдения будет добавлен код события, а в случае HTTPСервисОтвет данный объект будет дозаполнен данными
// логируемого сообщения (для кода 200).  
// 
// Параметры:
// 	Событие - Строка - логируемое событие в формате "ГруппаСобытий.Событие.Дополнительно";
// 	Сообщение - Строка - текст сообщения;
// 	Объект - ЛюбаяСсылка - ссылка на логируемый объект;
// 	ДополнительныеДанные - Структура - описание:
//		* HTTPОтвет - HTTPОтвет - HTTP-ответ сервера, к которому производился запрос;
//		* HTTPСервисОтвет - HTTPСервисОтвет - HTTP-ответ веб-сервиса;
//		* Объект - ЛюбаяСсылка - ссылка на объект, метаданные которого необходимо добавить в лог; 
Процедура Информация(Знач Событие, Знач Сообщение, ДополнительныеДанные = Неопределено) Экспорт

	ПодготовитьHTTPСервисОтвет( ДополнительныеДанные, УровеньЖурналаРегистрации.Информация, Сообщение);
	Записать( Событие, УровеньЖурналаРегистрации.Информация, Сообщение, ДополнительныеДанные);

КонецПроцедуры

// Логирует предупреждение. Если в дополнительных данных передать HTTPОтвет или HTTPСервисОтвет, то в событие
// логируемого сообдения будет добавлен код события, а в случае HTTPСервисОтвет данный объект будет дозаполнен данными
// логируемого сообщения (для кода 200).
// 
// Параметры:
// 	Событие - Строка - логируемое событие в формате "ГруппаСобытий.Событие.Дополнительно";
// 	Сообщение - Строка - текст сообщения;
// 	Объект - ЛюбаяСсылка - ссылка на логируемый объект;
// 	ДополнительныеДанные - Структура - описание:
//		* HTTPОтвет - HTTPОтвет - HTTP-ответ сервера, к которому производился запрос;
//		* HTTPСервисОтвет - HTTPСервисОтвет - HTTP-ответ веб-сервиса;
//		* Объект - ЛюбаяСсылка - ссылка на объект, метаданные которого необходимо добавить в лог; 
Процедура Предупреждение(Знач Событие, Знач Сообщение, Знач ДополнительныеДанные = Неопределено) Экспорт

	ПодготовитьHTTPСервисОтвет( ДополнительныеДанные, УровеньЖурналаРегистрации.Предупреждение,	Сообщение);
	Записать( Событие, УровеньЖурналаРегистрации.Предупреждение, Сообщение, ДополнительныеДанные);

КонецПроцедуры

// Логирует ошибку. Если в дополнительных данных передать HTTPОтвет или HTTPСервисОтвет, то в событие
// логируемого сообдения будет добавлен код события, а в случае HTTPСервисОтвет данный объект будет дозаполнен данными
// логируемого сообщения (для кода 200).
// 
// Параметры:
// 	Событие - Строка - логируемое событие в формате "ГруппаСобытий.Событие.Дополнительно";
// 	Сообщение - Строка - текст сообщения;
// 	Объект - ЛюбаяСсылка - ссылка на логируемый объект;
// 	ДополнительныеДанные - Структура - описание:
//		* HTTPОтвет - HTTPОтвет - HTTP-ответ сервера, к которому производился запрос;
//		* HTTPСервисОтвет - HTTPСервисОтвет - HTTP-ответ веб-сервиса;
//		* Объект - ЛюбаяСсылка - ссылка на объект, метаданные которого необходимо добавить в лог; 
Процедура Ошибка(Знач Событие, Знач Сообщение, Знач ДополнительныеДанные = Неопределено) Экспорт

	ПодготовитьHTTPСервисОтвет( ДополнительныеДанные, УровеньЖурналаРегистрации.Ошибка, Сообщение);
	Записать( Событие, УровеньЖурналаРегистрации.Ошибка, Сообщение, ДополнительныеДанные);

КонецПроцедуры


// TODO пересмотреть
// Парсинг строки события на элементы и возврат их в виде структуры.
// 
// Параметры:
// 	ТекстСобытия - Строка - логируемое ТекстСобытия;
// Возвращаемое значение:
// 	Структура - Описание:
// * Объект - Строка - объект ("Webhook"), для которого логируются события;
// * Событие - Строка - текст события;
// * КодСостоянияHTTP - Число - код состояния HTTP;
Функция ПреобразоватьСтрокуСобытияВСтруктуру(Знач ТекстСобытия) Экспорт
	
	Перем ЭлементыСобытия;
	Перем ПредставлениеСобытия;
	Перем ОписаниеТипа;
	Перем ИндексПоследнегоЭлемента;
	Перем ПоследнийЭлемент;
	Перем Результат;
	
	Результат = Новый Структура;
	Результат.Вставить("Объект", "");
	Результат.Вставить("Источник", "System");
	Результат.Вставить("Событие", "");
	Результат.Вставить("ПредставлениеСобытия", "");
	Результат.Вставить("КодСостоянияHTTP", 0);
	
	Если ТипЗнч(ТекстСобытия) <> Тип("Строка") Тогда
		Возврат Результат;
	КонецЕсли;	
	
	ЭлементыСобытия = СтрРазделить(ТекстСобытия, ".");
	
	Если ЭлементыСобытия.Количество() < 3 Тогда
		Возврат Результат;					
	КонецЕсли;

	Результат.Объект = ЭлементыСобытия[0];
	Результат.Источник = ЭлементыСобытия[1];
	Результат.Событие = ТекстСобытия;
	
	ПоследнийЭлемент = ЭлементыСобытия[ЭлементыСобытия.ВГраница()];
	ОписаниеТипа = Новый ОписаниеТипов("Число");
	ПоследнийЭлемент = ОписаниеТипа.ПривестиЗначение(ПоследнийЭлемент);
	Результат.КодСостоянияHTTP = ПоследнийЭлемент;
	
	ИндексПоследнегоЭлемента = ?(ПоследнийЭлемент = 0, ЭлементыСобытия.ВГраница(), ЭлементыСобытия.ВГраница() - 1);

	ПредставлениеСобытия = Новый Массив;
	Для Индекс = 2 По ИндексПоследнегоЭлемента Цикл
		ПредставлениеСобытия.Добавить(ЭлементыСобытия[Индекс]);
	КонецЦикла;
	
	Результат.ПредставлениеСобытия = СтрСоединить(ПредставлениеСобытия, ".");
	
	Возврат Результат;
	
КонецФункции


// TODO пересмотреть

// Декоратор (обертка) загрузки данных в некоторый объект из журнала регистрации. Например, если в качестве метаданных
// передать справочник и указать в ТабличнаяЧасть имя, то в этот справочник (в табличную часть) будут загружены данные
// из журнала регистрации по переданным в процедуру параметрам отбора.
// 
// Параметры:
// 	Метаданные - ОбъектМетаданных - объект, в который необходимо загрузить данные журнала регистрации;
// 	ТабличнаяЧасть - Строка - имя табличной части объекта метаданных,
// 		поддерживающих табличные части (например, для справочников);
// 	ПараметрыОтбора - Структура - параметры отбора журнала регистрации
// 		(См. глобальный контекст ЗагрузитьИсториюСобытийВходящихПараметров);
// 	ДобавленоЗаписей - Число - возвращаемый параметр, количество добавленных записей;
Процедура ДекораторЗагрузитьИсториюСобытий(Знач Метаданные,
												Знач ТабличнаяЧасть = Неопределено,
												Знач ПараметрыОтбора,
												ДобавленоЗаписей) Экспорт
	
	Перем Ссылка;
	Перем ТекстСообщения;
	
	Если ОбщегоНазначения.ЭтоСправочник(Метаданные) Тогда
		
		Если ТабличнаяЧасть = Неопределено Тогда
			Возврат;
		КонецЕсли;
		
		Если Метаданные.ТабличныеЧасти.Найти(ТабличнаяЧасть) = Неопределено Тогда
			Возврат;			
		КонецЕсли;
		
		Ссылка = Неопределено;
		Если ПараметрыОтбора.Свойство("Данные", Ссылка) Тогда
			Попытка
				Справочники[Метаданные.Имя].ЗагрузитьИсториюСобытий(Ссылка, ПараметрыОтбора, ДобавленоЗаписей);
			Исключение
				ДополнительныеПараметры = Логирование.ДополнительныеДанные();
				ДополнительныеПараметры.Объект = Ссылка;
				ТекстСообщения = НСтр("ru = 'Для Справочник.%1 не реализован метод ЗагрузитьИсториюСобытий().'");
				ТекстСообщения = СтрШаблон(ТекстСообщения, Метаданные.Имя);
				Логирование.Ошибка( "System.ИсторияСобытий", ТекстСообщения, ДополнительныеПараметры );
				ВызватьИсключение;
			КонецПопытки;
		КонецЕсли;
	КонецЕсли;
	
	// ... тут может быть реализация для регистра сведений и т.д.

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СоответствиеТиповСообщенийСхемеОтвета()
	
	Перем Результат;
	
	Результат = Новый Соответствие();
	Результат.Вставить("Информация", "info");
	Результат.Вставить("Предупреждение", "warning");
	Результат.Вставить("Ошибка", "error");
	
	Возврат Результат;
		
КонецФункции

Процедура ДополнитьТекстСобытияКодомСостояния( Событие, Знач ДополнительныеДанные = Неопределено)
	
	Перем HTTPОбъект;
	
	HTTPОбъект = ОбщегоНазначенияКлиентСервер.СвойствоСтруктуры( ДополнительныеДанные, "HTTPОтвет" );
	
	Если ( HTTPОбъект = Неопределено ) Тогда
		
		HTTPОбъект = ОбщегоНазначенияКлиентСервер.СвойствоСтруктуры( ДополнительныеДанные, "HTTPСервисОтвет" );
		
	КонецЕсли;

	Если ( HTTPОбъект <> Неопределено ) Тогда
			
		Событие = Событие + "." + Строка( HTTPОбъект.КодСостояния );
		
	КонецЕсли;

КонецПроцедуры

Процедура ПодготовитьHTTPСервисОтвет( ДополнительныеДанные, Знач Тип, Знач Сообщение )
	
	Перем HTTPСервисОтвет;
	Перем ТелоОтвета;
	Перем СформироватьТелоЗапроса;
	
	HTTPСервисОтвет = ОбщегоНазначенияКлиентСервер.СвойствоСтруктуры( ДополнительныеДанные, "HTTPСервисОтвет" );
	
	Если ( HTTPСервисОтвет = Неопределено ) Тогда
		
		Возврат;
		
	КонецЕсли;
	
	СформироватьТелоЗапроса = КодОтветаHTTP.isOk(HTTPСервисОтвет.КодСостояния)
			ИЛИ КодОтветаHTTP.isForbidden(HTTPСервисОтвет.КодСостояния)
			ИЛИ КодОтветаHTTP.isLocked(HTTPСервисОтвет.КодСостояния);

	Если ( СформироватьТелоЗапроса ) Тогда

		HTTPСервисОтвет.Заголовки.Вставить("Content-Type", "application/json");
		
		ТелоОтвета = РаботаСИнтернетСервисами.СтруктураОтвета();
		ТелоОтвета.message = Сообщение;
		ТелоОтвета.type = СоответствиеТиповСообщенийСхемеОтвета().Получить( Строка(Тип) );
		
		HTTPСервисОтвет.УстановитьТелоИзСтроки( КоннекторHTTP.ОбъектВJson(ТелоОтвета) );

	КонецЕсли;
	
КонецПроцедуры

Процедура Записать( Знач Событие, Знач Тип, Знач Сообщение, Знач ДополнительныеДанные = Неопределено )
	
	Перем Объект;
	
	ДополнитьТекстСобытияКодомСостояния( Событие, ДополнительныеДанные );

	Событие = "ОбработчикиСобытий." + Событие;
	Объект = ОбщегоНазначенияКлиентСервер.СвойствоСтруктуры( ДополнительныеДанные, "Объект") ;

	Если (Объект = Неопределено) Тогда

		ЗаписьЖурналаРегистрации( Событие, Тип, , , Сообщение);

	Иначе

		ЗаписьЖурналаРегистрации( Событие, Тип, Метаданные.НайтиПоТипу(ТипЗнч(Объект)), Объект, Сообщение );

	КонецЕсли;

КонецПроцедуры

#КонецОбласти