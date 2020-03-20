#Область СлужебныйПрограммныйИнтерфейс

Функция ServicesGET( Запрос )
	
	Перем ОписаниеСервиса;
	Перем Ответ;
	
	Ответ = Новый HTTPСервисОтвет( КодОтветаHTTP.КодыОтветаHTTP().OK );
	
	ОписаниеСервиса = РаботаСИнтернетСервисами.ПолучитьОписаниеСервиса( "gitlab" );
	
	ТелоОтвета = Новый Структура();
	ТелоОтвета.Вставить( "version", Метаданные.Версия );
	ТелоОтвета.Вставить( "services", ОписаниеСервиса );
	
	Ответ.Заголовки.Вставить( "Content-Type", "application/json" );
	Ответ.УстановитьТелоИзСтроки( КоннекторHTTP.ОбъектВJson(ТелоОтвета) );
	
	Возврат Ответ;
	
КонецФункции

// TODO переделать

Функция WebhooksPOST(Запрос)
	
	Перем Ответ;
	Перем ОбработчикСобытий;
	Перем ТекстСообщения;
	Перем ДанныеТелаЗапроса;
	
	Ответ = Новый HTTPСервисОтвет( КодОтветаHTTP.КодыОтветаHTTP().BAD_REQUEST );
	ОбработчикСобытий = СервисыGitLab.НайтиОбработчикСобытияПоHTTPЗапросу(Запрос);

	ДополнительныеПараметры = Логирование.ДополнительныеДанные();	
	ДополнительныеПараметры.Объект = ОбработчикСобытий;
	ДополнительныеПараметры.HTTPСервисОтвет = Ответ;
	
	Если ОбработчикСобытий = Неопределено Тогда
		
		Ответ = Новый HTTPСервисОтвет( КодОтветаHTTP.КодыОтветаHTTP().FORBIDDEN );
		
		ТекстСообщения = НСтр("ru = 'Секретный токен не найден.'");
		Логирование.Ошибка("GitLab.ОбработкаЗапроса", ТекстСообщения, ДополнительныеПараметры);
										 
		Возврат Ответ;
		
	КонецЕсли;
	
	Если Не ПолучитьФункциональнуюОпцию("ЗагружатьФайлыИзВнешнегоХранилища") Тогда

		Ответ = Новый HTTPСервисОтвет(КодОтветаHTTP.КодыОтветаHTTP().LOCKED);
		
		ТекстСообщения = НСтр("ru = 'Функционал загрузки из внешнего хранилища отключен.'");
		Логирование.Предупреждение("GitLab.ОбработкаЗапроса", ТекстСообщения, ДополнительныеПараметры);

		Возврат Ответ;

	КонецЕсли;
	
	Ответ = Неопределено;
	СервисыGitLab.ПроверитьЗапросUpdates(ОбработчикСобытий, Запрос, Ответ);
	
	Если ( КодОтветаHTTP.isOk(Ответ.КодСостояния) ) Тогда
		
		ДанныеТелаЗапроса = Неопределено;
		СервисыGitLab.ПолучитьДанныеТелаЗапроса(ОбработчикСобытий, Запрос, Ответ, ДанныеТелаЗапроса);
		
	КонецЕсли;
	
	Если ( КодОтветаHTTP.isOk(Ответ.КодСостояния) ) Тогда
		
		СервисыGitLab.ПроверитьТелоЗапроса(ОбработчикСобытий, ДанныеТелаЗапроса, Ответ);
		
	КонецЕсли;
	
	Если ( КодОтветаHTTP.isOk(Ответ.КодСостояния) ) Тогда
		
		СервисыGitLab.ЗапуститьОбработкуДанныхВФоне(ОбработчикСобытий, ДанныеТелаЗапроса);
		
	КонецЕсли;
	
	Если ( КодОтветаHTTP.isOk(Ответ.КодСостояния) ) Тогда
		
		ТекстСообщения = НСтр("ru = 'Запрос обработан.'");
		Логирование.Информация( "GitLab.ОбработкаЗапроса.Окончание", ТекстСообщения, ДополнительныеПараметры );
											 
	КонецЕсли;
	
	Возврат Ответ;
	
КонецФункции

#КонецОбласти