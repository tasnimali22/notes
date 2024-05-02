import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../localdatabase/localdb.dart';
import 'card item.dart';

/*class EditContact extends StatelessWidget {
  Map contactId;
   EditContact({super.key,required this.contactId});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 390,
        decoration: const BoxDecoration(
          color: Color(0xFFFAF0E6),
        ),
        child: Column(
          children: [
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
            Row(
              children: [
                TextButton(onPressed: (){
                  UpdateDatabase(id: contactId["id"],
                      title: title.text,
                      subtitle:  title.text);
                }, child: Text("save")),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("cancel")),

              ],
            )
          ],
        ),

      ),
    );
  }
}
*/