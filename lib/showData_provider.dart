import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class showData extends ChangeNotifier {
  // Global variables

  bool text_show = false;
  List<Map<String, dynamic>> n_list = [];
  TextEditingController recieve_Data = TextEditingController();

  // Add data with dialog
  openDial(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: TextField(
          controller: recieve_Data,
          decoration: InputDecoration(
            hintText: 'Enter your Task',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.0),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('CANCEL'),
          ),
          TextButton(
            onPressed: () {
              var data = {
                'data': recieve_Data.text,
                'bool': false,
              };
              n_list.add(data);
              notifyListeners();
              recieve_Data.clear(); // Clear input field
              Navigator.of(context).pop();
            },
            child: Text('SAVE'),
          ),
        ],
      ),
    );
  }

  // Show data in container
  Widget showContainer_text(int index, BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              n_list[index]['data'],
              style: TextStyle(
                  fontSize: 25,
                  color: n_list[index]['bool'] ? Colors.grey  : Colors.black,
                  decoration: n_list[index]['bool'] ? TextDecoration.lineThrough : TextDecoration.none,
                  fontFamily: 'write',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  // Toggle the `bool` value in `n_list`
  bool toggleBool(int index) {
    n_list[index]['bool'] = !n_list[index]['bool'];
    notifyListeners();
    return n_list[index]['bool']; // Notify listeners to update UI
  }

  //edit button

  dynamic delete(index) {
    return Container(
      child: IconButton(
          onPressed: () {
            print(n_list.length);
            n_list.removeAt(index);
            notifyListeners();
            print(n_list.length);
          },
          icon: Icon(
            Icons.delete,
            size: 20,
            color: Colors.red,
          )),
    );
  }



  dynamic edit(index ,  BuildContext context){
    return Container(
      child: IconButton(onPressed: (){

        TextEditingController cr = TextEditingController();
        cr.text = n_list[index]['data'];

         showDialog(
             context: context,
             builder: (context)=>AlertDialog(
               title: TextField(
                 controller: cr,
                 decoration: InputDecoration(
                   hintText: 'Enter your Task',
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(13.0),
                   ),
                 ),
               ),
               actions: [
                 TextButton(
                   onPressed: () {
                     Navigator.of(context).pop();
                   },
                   child: Text('CANCEL'),
                 ),
                 TextButton(
                   onPressed: () {
                  n_list[index]['data'] =cr.text;
                  notifyListeners();
                   Navigator.of(context).pop();
                   },
                   child: Text('SAVE'),
                 ),
               ],
             ),







         );


         }, icon: Icon(Icons.edit , color: Colors.black54,)),
    );

  }

}
