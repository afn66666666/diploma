enum CardColumns {
  Id,
  Name,
  Date,
  Author,
  InfoYear,
  InfoSource,
  ReceiveType, //TODO: will be enum
  ExcavationDate,
  Description,
  Count,
  Material, //TODO: will be enum
  Size,
  Preservation,
  StoragePlace, //TODO: will be enum i guess...
  InfoActNumber,
  RegistrationNumber,
  InventoryNumber,
  Note,
  Media,
  Geodata,
  ColumnsAmount
}

const List<String> labels = [
  ('Номер карточки'),
  'Имя',
  'Дата создания',
  'Автор',
  'Год получения информации',
  'Источник получения информации',
  'Вид получения',
  'Дата раскопок',
  'Подробное описание',
  'Количество',
  'Материалы',
  'Размер',
  'Состояние',
  'Место хранения',
  'Номер информационного акта',
  'Номер регистрации',
  'Инвентарный номер',
  'Доп. сведения',
  'Фото',
  'Место нахождения (раскопок)',
];

const bool isAuthorizationEnabled = true;
const bool isDatabaseTouched = false;

const String cardTableName = 'card_legacy';
const String userTableName = 'users';
const double flangPadding = 10;
const double frontPadding = 5;

const List<String> columnNames = [
// column names
  'id',
  'name',
  'usage_names',
  'placement',
  'period',
  'history',
  'appearance',
  'author',
  'data_source',
  'resources',
  'creation_date',
];
var defaultDbSimulationDelay = const Duration(seconds: 2);
