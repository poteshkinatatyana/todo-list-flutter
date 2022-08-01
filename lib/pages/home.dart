import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _userTodo = '';
  List todoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    todoList.addAll(['Tokio Hotel', 'Hollywood undead','Maroon5','Sum 41']);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(title: Text('List of musical artists'),
      centerTitle: true,),
    body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index){
          return Dismissible(
              key: Key(todoList[index]),
              child: Card(
                child: ListTile(
                    title: Text(todoList[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_sharp, color: Colors.red),
                    onPressed: (){
                      setState(() {
                        todoList.removeAt(index);
                      });
                    }
                  ),
                ),
              ),
          onDismissed: (direction){
               setState(() {
                 todoList.removeAt(index);
               });
          },);
        }),
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text('Add artist'),
              content: TextField(
                onChanged: (String value){
                  _userTodo = value;
                },
              ),
              actions: [
                ElevatedButton(style: ElevatedButton.styleFrom(
                  primary: Colors.black,

                ),onPressed: (){
                  setState(() {
                    todoList.add(_userTodo);
                  });

                  Navigator.of(context).pop();
                },
                  child: Text('Add artist'),

                ),

              ],
            );
          });
        },
        child: Icon(Icons.add_box, color: Colors.red),
        backgroundColor: Colors.black,
      ),
    );
  }
}
