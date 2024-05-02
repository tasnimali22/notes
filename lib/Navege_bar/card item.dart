import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../localdatabase/localdb.dart';
import '../localdatabase/localdb.dart';


class CardItem extends StatefulWidget {
  Map contactModel;
   CardItem({super.key ,required this.contactModel});

  @override
  State<CardItem> createState() => _CardItemState();
}
var title = TextEditingController();
var subtitle = TextEditingController();

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Dismissible(
        key: GlobalKey(),
        onDismissed: (DismissDirection dir){
          setState(() {
            deleteContact(id:widget.contactModel["id"]);
          });
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(
                dir == DismissDirection.startToEnd
                    ?"$contactsList removed"
                   : "$contactsList Favorite"
              ),
                  action:SnackBarAction(
                      label: "UNDO",
                      onPressed: (){
                        setState(() {
                          insertDataBase(title:title.text , subtitle: subtitle.text);
                        });
                      })
              ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                end: AlignmentDirectional.topStart,
                begin: AlignmentDirectional.center,
                colors: [Colors.grey, Colors.orangeAccent],
            ),
          ),
          child: ListTile(
            //leading:Icon(Icons.dangerous) ,
            title: Text(widget.contactModel['title'],style: TextStyle(fontSize: 27),),
            subtitle: Text(widget.contactModel["subtitle"],style: TextStyle(fontSize: 17)),


          ),
        ),
      ),
    );
  }
}
