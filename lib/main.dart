import 'package:flutter/material.dart';

void main() { runApp(new TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        title: 'Todo List',
        home: new TodoList()
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List todos = List();
  String input = "";


  void initState(){
    super.initState();
    todos.add("Item 1");
    todos.add("Item 2");
    todos.add("Item 3");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('mytodos')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              title: Text("Add Todo List"),
              content: TextField(
                onChanged: (String value){
                  input = value;
                },

              ),

              actions: <Widget>[
                FlatButton(
                    onPressed: (){
                      setState(() {
                        todos.add(input);
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text("Add Detail"))
              ],
            );
          });
        },
      ),
      body:  ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Dismissible(
                key: Key(todos[index]),
                child: Card(
                  margin: EdgeInsets.all(8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    title: Text(todos[index]),
                  ),
                ));
          }),
    );


  }
}



