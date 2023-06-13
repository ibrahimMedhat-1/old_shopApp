import 'package:exam_project/electronic_widget.dart';
import 'package:exam_project/list.dart';
import 'package:flutter/material.dart';
// import 'list.dart';

void main(){
  return(runApp(const MaterialApp(home:Electronics())));
}
class Electronics extends StatefulWidget {
  const Electronics({Key? key}) : super(key: key);

  @override
  State<Electronics> createState() => ElectronicsState();
}

class ElectronicsState extends State<Electronics> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Electronics Products",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),backgroundColor: Colors.black,),
      body: Container(color: Colors.black54,height: 900,
        child: SingleChildScrollView(
            child: SizedBox(
              child:Column(children: Cat_List.catlist.map((elec) => Elec(elec,this) ).toList() ),
            ),
        ),
      ) ,
    floatingActionButton: FloatingActionButton(backgroundColor: Colors.black,
      onPressed: (){ Navigator.pushNamed(context, "/AddProduct"); },
      child:const Icon(Icons.add,color: Colors.amber,),
    ),);
  }
}
