enum CardColumns {
  Id,
  Name,
  UsageNames,
  Placement,
  Period,
  History,
  Appearance,
  Author,
  DataSource,
  Resources,
  CreationDate,
  ExcavationYear,
  ExcavationDate,
  ColumnsAmount
}

const List<String> labels = [
  ('Номер карточки'),
  'Наименование объекта',
  'Обиходные названия*',
  'Место размещения объекта',
  'Время возникновения, открытия объекта',
  'Краткая история объекта',
  'Внешние признаки (особенности стиля)',
  'Данные об авторах объекта',
  'Источники сведений об объекте',
  'Фотографии или видеоматериалы',
  'Дата составления карточки',
  'Год раскопок',
  'Дата раскопок'
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