// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class add_provider extends ChangeNotifier{
//
//    List<Map<String,dynamic>> mainData = [];
// TextEditingController recieve_Data = TextEditingController();
//
//
//    //TextField provider
//         openDial(BuildContext context){
//                return showDialog(
//                    context: context,
//                    builder: (context)=>AlertDialog(
//                       title: TextField(
//                    controller: recieve_Data,
//                      decoration: InputDecoration(
//                        hintText: 'Enter your Task',
//                        border: OutlineInputBorder(
//                          borderRadius: BorderRadius.circular(13.0),
//                        ),
//                      ),
//                   ),
//                      actions: [
//
//                         TextButton(onPressed: (){
//
//                             Navigator.of(context).pop();
//                           },
//
//                             child: Text('CANCEL')),
//
//
//
//                        TextButton(onPressed: (){
//
//                          var data = {
//                            'data' : recieve_Data.text,
//                            'bool' : false,
//                          };
//
//                          mainData.add(data);
//                          notifyListeners();
//                          print(mainData);
//                          Navigator.of(context).pop();
//                         },
//
//                            child: Text('SAVE')),
//                        ],
//                    )
//                  );
//           }
//
//   }