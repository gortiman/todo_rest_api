import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_rest_api/todo_list/add_todo.dart';



/// All todo api will call here
class TodoService{

  // static Future<void> navigateToEditPage(Map item) async {
  //   final route = MaterialPageRoute(
  //       builder: (context)=> AddTodo(todo: item),
  //   );
  //   await Navigator.push(context, route);
  // }
  //
  // static Future<void> navigateToAddPage() async{
  //   final route = MaterialPageRoute(builder: (context)=> AddTodo(),);
  //   await Navigator.push(context, route);
  // }

  static Future<bool> deleteById(String id) async{
    //delete the item
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    return response.statusCode == 200;
    // if(response.statusCode == 200){
    //   final filtered = items.where((element) => element['_id'] !=id).toList,
    // setState((){
    //   items = filtered;
    //   });
    // }else{
    //   showErrorMessage(context,
    //       message: 'Deletion Failed');
    // }
  }

  static Future<List?> fetchTodos() async{
    // final url = 'https://api.nstack.in/v1/todo?page=1&limit=10';
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.body);
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as Map;  // map mila sbse pehle iska datatype map h
      final result = json['items'] as List; // item ek list h
      return result;
    }else{
      return null;
    }
  }

  static Future<bool> updateTodo(String id, Map body) async{
    final url = 'https://jsonplaceholder.typicode.com/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.put(uri,
    body:jsonEncode(body),
    headers: {'Content-Type' : 'application/json'});
    return response.statusCode == 200;
  }

  static Future<bool> addTodo(Map body) async{
    final url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: {'Content-Type' : 'application/json'});
    return response.statusCode == 201;
  }
}




// https://api.nstack.in/#/
//  http://api.nstack.in/