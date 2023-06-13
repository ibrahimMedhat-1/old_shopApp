import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  return runApp(const MaterialApp(home: FeedBack(),));
}
class FeedBack extends StatelessWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("any comment"),),
      body:Column(children:const [
        Text("Comments",style: TextStyle(fontSize: 30),),
        TextField(),
        Card(color:Colors.blue,child:Text("Save",style: TextStyle(fontSize: 30,),))
      ],),
    );
  }
}
