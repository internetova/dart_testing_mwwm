import 'package:dart_testing/domain/question.dart';

/// Моковые данные для теста, пока генерирую рыбу
/// todo удалить по завершении
/// пока правильный ответ всегда первый
/// позже заменю на вопросы
// final List<Question> questionsMock = List<Question>.generate(
//   30,
//   (index) => Question(
//     id: index,
//     question: 'Вопрос $index',
//     responseOptions: [
//       'Вариант ответа 1',
//       'Вариант ответа 2',
//       'Вариант ответа 3',
//     ],
//     idRightResponse: 0,
//   ),
// );

final List<Question> questionsMock = [
Question(
    id: 1,
    question: 'За счёт чего приложения на Dart показывают высокую производительность?',
    responseOptions: [
      'За счет многопоточности.',
      'Код приложения компилируется в бинарный платформенный код.',
      'В каждое приложение встраивается виртуальная машина Java.',
    ],
    idRightResponse: 1,
  ),
  Question(
    id: 2,
    question: 'Для чего используется dynamic?',
    responseOptions: [
      'Позволяет менять тип переменной в процессе исполнения кода - отключает статическую проверку типов.',
      'Для автоматического преобразования строки в число.',
      'Это переменная цикла для изменения значения итератора.',
    ],
    idRightResponse: 0,
  ),
  Question(
    id: 3,
    question: 'Для чего обычно переопределяют toString()?',
    responseOptions: [
      'Для преобразования чисел в строки.',
      'Чтобы инициализировать все поля объекта типом String.',
      'Чтобы в консоли отображалось необходимое разработчику описание объекта.',
    ],
    idRightResponse: 2,
  ),
  Question(
    id: 4,
    question: 'Как удобнее просуммировать числа в списке?',
    responseOptions: [
      'Цикл for.',
      'Метод sum.',
      'Метод reduce.',
    ],
    idRightResponse: 2,
  ),
  Question(
    id: 5,
    question: 'Как из списка удобнее получить уникальные значения?',
    responseOptions: [
      'Преобразовать список в множество.',
      'Циклом сравнивать значения и формировать новый список.',
      'Использовать метод unique.',
    ],
    idRightResponse: 0,
  ),
  Question(
    id: 6,
    question: 'Чем отличается класс от объекта?',
    responseOptions: [
      'Это одно и тоже.',
      'Класс это шаблон, по которому создаются объекты.',
      'В классе описаны только свойства, а в объекте описывают методы.',
    ],
    idRightResponse: 1,
  ),
  Question(
    id: 7,
    question: 'Для чего нужны миксины?',
    responseOptions: [
      'Чтобы можно было задать сразу два типа у переменной.',
      'Чтобы подмешивать готовую реализацию к любому классу.',
      'Это функции для рандомного перемешивания значений списка.',
    ],
    idRightResponse: 1,
  ),
  Question(
    id: 8,
    question: 'Как пишут интерфейсы в Dart?',
    responseOptions: [
      'Наследуется от готового класса.',
      'Применяют библиотеку interface.',
      'Создают абстрактный класс.',
    ],
    idRightResponse: 2,
  ),
  Question(
    id: 9,
    question: 'Зачем нужны Generics?',
    responseOptions: [
      'Чтобы писать универсальный код.',
      'Для генерации произвольных списков.',
      'Такой функции в Dart нет.',
    ],
    idRightResponse: 0,
  ),
  Question(
    id: 10,
    question: 'Что такое EventLoop?',
    responseOptions: [
      'Это класс для работы с циклами.',
      'Компонент Dart, который управляет очерёдностью исполнения инструкций.',
      'Глобальная функция для обращения к любой переменной.',
    ],
    idRightResponse: 1,
  ),
];