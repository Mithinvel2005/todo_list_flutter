import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

String botton="cliked button";
TextEditingController controller = TextEditingController();
List<String> tasklist = [];
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
          title: Text("Todo List"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Expanded(
                    child: Container(
                      height: 50,
                      width: 250,
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          
                          border: OutlineInputBorder(

                          ),
                         labelText:"type any text",
                         labelStyle: TextStyle(
                          fontSize: 17,
                         )
                         
                        ),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.white,
                  height: 50,
             
                  shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  onPressed: () {
                        setState(() {
                        tasklist.add(controller.text);
                        controller.clear();
                        });
                  },child: Text("add"),
                  ),
              
              ],
            ),
             
                  Flexible(
                    child: ListView.builder(
                      itemCount: tasklist.length,
                      itemBuilder: (context, index) {
                      return Row(
                    children: [
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.all(10),
                        child: Container(child: Text(tasklist[index])),
                      ),
                    ),
                    MaterialButton(
                      child: Icon(Icons.delete,color: Colors.red,),
                      onPressed: (){
                        setState(() {
                          tasklist.removeAt(index);  
                        });
                                             }
                    ),
                    ],
                    );
                                   }
                                   ),
                  )
               
          ],
        )
      ),
    );
  }
}
