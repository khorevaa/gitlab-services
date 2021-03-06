# language: ru

@tree
@classname=ModuleExceptionPath

Функционал: Тест логирование сервер
	Как Разработчик
	Я Хочу чтобы возвращаемое значение метода совпадало с эталонным
	Чтобы я мог гарантировать работоспособность метода

@OnServer
Сценарий: Тест_ЛогированиеСервер (сервер): Тест_ЛогированиеТолькоСобытие
	И я выполняю код встроенного языка на сервере
	| 'Тест_ЛогированиеСервер.Тест_ЛогированиеТолькоСобытие(Контекст());' |

@OnServer
Сценарий: Тест_ЛогированиеСервер (сервер): Тест_ЛогированиеСобытиеСОбъектом
	И я выполняю код встроенного языка на сервере
	| 'Тест_ЛогированиеСервер.Тест_ЛогированиеСобытиеСОбъектом(Контекст());' |

@OnServer
Сценарий: Тест_ЛогированиеСервер (сервер): Тест_ЛогированиеСОбъектомИHTTPСервисОтвет200
	И я выполняю код встроенного языка на сервере
	| 'Тест_ЛогированиеСервер.Тест_ЛогированиеСОбъектомИHTTPСервисОтвет200(Контекст());' |

@OnServer
Сценарий: Тест_ЛогированиеСервер (сервер): Тест_ЛогированиеСОбъектомИHTTPСервисОтвет400
	И я выполняю код встроенного языка на сервере
	| 'Тест_ЛогированиеСервер.Тест_ЛогированиеСОбъектомИHTTPСервисОтвет400(Контекст());' |

@OnServer
Сценарий: Тест_ЛогированиеСервер (сервер): Тест_ЛогированиеHTTPСервисОтветТелоОтвета
	И я выполняю код встроенного языка на сервере
	| 'Тест_ЛогированиеСервер.Тест_ЛогированиеHTTPСервисОтветТелоОтвета(Контекст());' |