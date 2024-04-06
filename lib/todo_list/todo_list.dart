import 'package:flutter/material.dart';
import 'package:todo_rest_api/todo_list/add_todo.dart';
import 'package:todo_rest_api/todo_list/services/todo_services.dart';
import 'package:todo_rest_api/todo_list/utils/snackbar_helper.dart';
import 'package:todo_rest_api/todo_list/widgets/todo_card.dart';


class TodoListScreeen extends StatefulWidget {
  const TodoListScreeen({super.key});

  @override
  State<TodoListScreeen> createState() => _TodoListScreeenState();
}

class _TodoListScreeenState extends State<TodoListScreeen> {

  bool isLoading = true;
  List items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black.withOpacity(0.7),
      appBar: AppBar(
        title: Text("Todo Lists", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
        centerTitle: true,
       // backgroundColor: Colors.grey.withOpacity(0.7)
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        label: Text('Add Todo'),
      ),

      body: Visibility(
        visible: isLoading,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        replacement: RefreshIndicator(
          onRefresh: fetchTodo,
          child: Visibility(
            visible: items.isNotEmpty,
            replacement: Center(
              child: Text("No Todo ITem",
              style: Theme.of(context).textTheme.headlineMedium,),
            ),
            child: ListView.builder(
              itemCount:  items.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (context,index){
                  final item = items[index] as Map;
                  final id = item['_id'] as String;
                  return TodoCard(
                      index: index,
                      item: item,
                      navigateEdit: navigateToEditPage,
                      deletedById: deleteById,
                  );
                })
          ),
        ),
      ),
    );
  }

  Future<void> navigateToEditPage(Map item) async {
    final route = MaterialPageRoute(builder: (context)=> AddTodo(todo: item,));
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(builder: (context)=> AddTodo());
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> deleteById(String id)async{
    // Delete the item
    final isSuccess = await TodoService.deleteById(id);
    if(isSuccess){
      final filtered = items.where((element)=>element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
    }else{
      showErrorMessage(context, message: "Deletion Failed");
    }
  }


  Future<void> fetchTodo() async{
    final response = await TodoService.fetchTodos();
    if(response != null){
      setState(() {
        items = response;
      });
    }else{
      showErrorMessage(context, message: 'Something went wrong');
    }
    setState(() {
      isLoading = false;
    });
  }

}
