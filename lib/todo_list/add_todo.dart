import 'package:flutter/material.dart';
import 'package:todo_rest_api/todo_list/services/todo_services.dart';
import 'package:todo_rest_api/todo_list/utils/snackbar_helper.dart';


class AddTodo extends StatefulWidget {
  final Map? todo;
  const AddTodo({super.key, this.todo});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.todo !=null){
      isEdit = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(isEdit ? "Edit Todo " : "Add Todo"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: "Enter title",
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: "Enter decription",
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            submitData();
          },
              child: Text("Submit")),
        ],
      ),
    );
  }

  Future<void> updateData() async{
    //Get the data from form
    final todo = widget.todo;
    if(todo == null){
      print("You can't call update without todo data");
      return;
    }
    final id = todo['_id'];

    // Submit updated data to the server
    final isSuccess = await TodoService.updateTodo(id, body);

    // show the success or fail message based on status
    if(isSuccess){
      showSuccessMessage(context, message: "Updation success");
    }else{
      showErrorMessage(context, message: "Updation Failed");
    }
  }

  Future<void> submitData() async{
    // submit data to the server
    final isSuccess = await TodoService.addTodo(body);
    // show success or fail message based on the status
    if(isSuccess){
      titleController.text = '';
      descriptionController.text = '';
      showSuccessMessage(context, message: "Creation Success");
    }else{
      showErrorMessage(context, message: "Creation Failed");
    }
    //
  }


  Map get body{
    // Get the data from form
    final title = titleController.text;
    final description = descriptionController.text;
    return {
      "title" : title,
      "description" : description,
      "is_Completed" : false,
    };
  }

}
