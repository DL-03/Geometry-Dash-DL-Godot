extends Node2D

var S = "ru"
var language = {
	"Import": {"eu": "Import", "ru": "Импорт"},
	"New": {"eu": "New", "ru": "Новый"},
	"Open": {"eu": "Open", "ru": "Открыть"},
	"Ok": {"eu": "Ok", "ru": "Ок"},
	"Cancel": {"eu": "Cancel", "ru": "Отмена"},
	"Close": {"eu": "Close", "ru": "Закрыть"},
	"Game": {"eu": "Game", "ru": "Игра"},
	"Close Game": {"eu": "Close Game", "ru": "Закрыть Игру"},
	"Save": {"eu": "Save", "ru": "Сохранить"},
	"Save As": {"eu": "Save As", "ru": "Сохр. Как"},
	"Delete": {"eu": "Delete", "ru": "Удалить"},
	"No": {"eu": "No", "ru": "Нет"},
	"Extra": {"eu": "Extra", "ru": "Екстра"},
	"Language": {"eu": "Language", "ru": "Язык"},
	"Settings": {"eu": "Settings", "ru": "Настройки"}
	}

func Tran(var text):
	return language[text][S]
