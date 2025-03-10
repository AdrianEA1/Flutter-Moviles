class TodoModel {
  int? idTodo;
  String? titleTodo;
  String? dsctodo;
  String? dateTodo;
  bool? statusTodo;

  TodoModel({this.idTodo, this.titleTodo, this.dsctodo, this.dateTodo, this.statusTodo});

  factory TodoModel.fromMap(Map<String, dynamic> map){
    return TodoModel(
      idTodo: map['idTodo'],
      titleTodo: map['titleTodo'],
      dsctodo: map['dsctodo'],
      dateTodo: map['dateTodo'],
      statusTodo: false,
      );
  }

}