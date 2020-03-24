# language: ru

@tree
@classname=ModuleExceptionPath

Функционал: Тест общий модуль сервер
	Как Разработчик
	Я Хочу чтобы возвращаемое значение метода совпадало с эталонным
	Чтобы я мог гарантировать работоспособность метода

@OnServer
Сценарий: Тест_ОбщийМодульСервер (сервер): Тест_ДополнитьКоллекциюТекстомИзПотока
	И я выполняю код встроенного языка на сервере
	| 'Тест_ОбщийМодульСервер.Тест_ДополнитьКоллекциюТекстомИзПотока(Контекст());' |

@OnServer
Сценарий: Тест_ОбщийМодульСервер (сервер): Тест_МетодьПотокВКоллекциюКакJSON
	И я выполняю код встроенного языка на сервере
	| 'Тест_ОбщийМодульСервер.Тест_МетодьПотокВКоллекциюКакJSON(Контекст());' |