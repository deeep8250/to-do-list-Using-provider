import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_new/showData_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => showData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: uiBuild(),
      ),
    );
  }
}

class uiBuild extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => uiState();
}

class uiState extends State<uiBuild> {
  @override
  Widget build(BuildContext context) {
    print('Widget built');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.black54,
          title: const Center(
            child: Text(
              'Your  *  N O T E S',
              style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Consumer<showData>(
        builder: (ctx, showdata, __) {
          return ListView.builder(
            itemCount: showdata.n_list.length,
            itemBuilder: (ctx, index) {
              bool nm = false;

              return Column(
                children: [

                  SizedBox(height: 30,),

                  Row(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('before nm : $nm');
                              nm = showdata.toggleBool(index);
                              print('after nm : $nm');// Toggle bool in provider
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                               border: Border.all(
                                 width: 2,
                                 color: Colors.black
                               )
                                ),
                                child: Center(
                                  child: showdata.n_list[index]['bool']
                                      ?Icon(Icons.check_circle,color: Colors.green,size: MediaQuery.of(context).size.width*0.09,)
                                      : Container(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: 10,),
                      Column(
                        children: [
                          showdata.showContainer_text(index,ctx),
                        ],
                      ),
                      Column(
                        children: [
                          showdata.delete(index),
                          showdata.edit(index, ctx)
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<showData>(context, listen: false).openDial(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
