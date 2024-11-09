import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_new/demo1_provider.dart';

void main()=>runApp(de());

class de extends StatelessWidget{
  @override
   Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (_)=> prov(),
      child: MaterialApp(
        home: dem(),
      ),
    );
  }
}

class dem extends StatefulWidget{
  State<StatefulWidget> createState()=>demo();
}
class demo extends State<dem>{
 late bool m = false;
  List <Map <String , bool>> n =[
    {'isbool' : false},
    {'isbool' : false},
    {'isbool' : false},
    {'isbool' : false},
    {'isbool' : false},

  ];


  @override
   Widget build(BuildContext context){
    return Scaffold(
      body: ListView.builder(
          itemCount: n.length,
          itemBuilder: (ctx, index){
            return Row(
              children: [
                GestureDetector(

                  onTap: (){
                       m = Provider.of<prov>(context,listen: false).func(n[index]['isbool']!);

                        n[index]['isbool'] = m;
                       print('m is : $m , index is : $index');
                  },


                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),

                       child: Consumer<prov>(
                         builder: (cxt , prov , __) {

                       return  Padding(
                             padding: const EdgeInsets.all(8.0),
                             child:  n[index]['isbool']! ?     Container(
                               width: 30,
                               height: 30,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(40),
                                 color: Colors.green,
                               ),
                             ) : null
                           );
                         }
                       ),
                  ),
                ),
              ],
            );
          }




      ),
    );
  }
}