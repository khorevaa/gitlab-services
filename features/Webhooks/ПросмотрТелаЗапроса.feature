#language: ru

Функционал: Просмотр тела запроса с сервера GitLab

Как Пользователь
Я хочу иметь возможность просмотреть тело POST запроса в формате JSON
Чтобы проанализировать данные запроса

Контекст:
    Дано Я подключаю TestClient "Этот клиент" логин "Пользователь" пароль ""
    И Я устанавливаю в константу "ЗагружатьФайлыИзВнешнегоХранилища" значение "Истина"
    И я закрыл все окна клиентского приложения
    И Я делаю POST запрос на "$$МестоположениеСервисовИБРаспределителя$$" с данными "$$ЭталонТелоPOSTЗапросаJSON$$" по ключу "$$GitlabToken$$"

Сценарий: Просмотр тела запроса для выбранного коммита
    И Я нахожу обработчик событий "ТестированиеВнешниеОбработки" и открываю его
    И в таблице "СохраненныеДанные" я перехожу к первой строке
    И в таблице "СохраненныеДанные" я нажимаю на кнопку '.json запроса'
    Тогда открылось окно 'Редактор JSON'
    И элемент формы "Коммиты" не доступен
    И элемент формы "ТекстJSON" доступен
    И элемент "ТекстJSON" доступен только для просмотра
    И элемент формы с именем "ПользовательскийВариант" не доступен
    И элемент формы с именем "СохранитьJSON" не доступен
    Тогда элемент формы с именем "ТекстJSON" стал равен "$$JSON$$"
    И Я закрываю окно 'Редактор JSON'