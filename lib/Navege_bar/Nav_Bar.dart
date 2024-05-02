import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../localdatabase/localdb.dart';
import 'card item.dart';

class Buttn_Nav extends StatefulWidget {
   Buttn_Nav({super.key});

  @override
  State<Buttn_Nav> createState() => _Buttn_NavState();
}

class _Buttn_NavState extends State<Buttn_Nav> {
  @override
  void initState() {
    CreateDatabase();
    super.initState();
  }

  var scaffoldkey = GlobalKey<ScaffoldState>();
  var title = TextEditingController();
  var subtitle = TextEditingController();

  bool isBottomSheet = false;
  IconData icons = Icons.mark_chat_read_outlined;

  void changeBottomSheet({required IconData icon, required bool isShow}){
    setState(() {
      isBottomSheet = isShow;
      icons= icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        key: scaffoldkey,
        appBar: AppBar(
          backgroundColor: const Color(0xFFcc66ff),
          title: const Text("Notes"),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFcc66ff),
         // sh controller.text,
           // argument: CircleBorder(),
    onPressed: () {
    if(isBottomSheet) {
    setState(() {
    insertDataBase(title:title.text,
    subtitle: subtitle.text);
              });
            }else {
      changeBottomSheet(icon: Icons.add, isShow: true);
    }
            scaffoldkey.currentState!.showBottomSheet((context) {
              return Container(
                width: 390,
                decoration: const BoxDecoration(
                  color: Color(0xFFFAF0E6),
                ),
                child:
                   TextField(
                     controller:title ,
                     maxLines: 10,
                     textCapitalization:TextCapitalization.sentences ,
                     decoration: const InputDecoration(
                      // counterText: "${countword(text.controller.text)}word",
                       labelText: "Nots",
                       alignLabelWithHint: true,
                       hintText: "type something....",
                       border: OutlineInputBorder(),
                     ),

                   ),

              );
            }).closed.then((value) {
              setState(() {
                changeBottomSheet(icon: Icons.add, isShow: false);
                insertDataBase(title: title.text, subtitle: subtitle.text);
              });
            });

          },
        child: Icon(icons),),
        body:  GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            itemCount: contactsList.length,
            itemBuilder: (context, index) => CardItem(contactModel: contactsList[index],),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),),
    ),
    );
  }
}
