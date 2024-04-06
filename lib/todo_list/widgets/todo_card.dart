import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final int index;
  final Map item;
  final Function(Map) navigateEdit;
  final Function(String) deletedById;
  TodoCard({
    super.key,
    required this.index,
    required this.item,
    required this.navigateEdit,
    required this.deletedById
  });

  @override
  Widget build(BuildContext context) {
    //final item = items[index] as Map;
    final id = item['_id'] as String;
    return Card(
        elevation: 1.0,
        color: Colors.grey.withOpacity(0.7),
        child: ListTile(
          leading: CircleAvatar(
            radius: 50,
            child:Text('${index+1}') ,
          ),
          title: Text(item['title']),
          subtitle: Text(item['description']),
          trailing: PopupMenuButton(
            onSelected: (value){
              if(value == 'edit'){
                //open edit page
                navigateEdit(item);
              }else if (value == 'delete'){
                deletedById(id);
              }
            },
              itemBuilder: (context){
              return [
                PopupMenuItem(child: Text('Edit'),
                value: 'edit',
                ),
                PopupMenuItem(child: Text('Delete'),
                value: 'delete',),
              ];
              }),
        ),
      );
  }
}
