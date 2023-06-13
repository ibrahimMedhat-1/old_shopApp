import 'package:exam_project/food_widget.dart';
import 'package:flutter/material.dart';

import 'list.dart';

void main(){
  return(runApp(const MaterialApp(home:Food())));
}

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);


  @override
  State<Food> createState() => FoodState();
}

class FoodState extends State<Food> {
  // ignore: non_constant_identifier_names
  Food_List? food_list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Food Products",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),backgroundColor: Colors.black,),
      body: Container(color:Colors.black54,height: 900,
        child: SingleChildScrollView(
          child:
          Column(
            children:[ SizedBox( height:350,
              child: Column(children: Food_List.foodlist.map((food) => FoodWidget(food,this)  ).toList()
                )
            ),InkWell ( child:const Card(color:Colors.black,child : Text("Feedback",style: TextStyle(fontSize: 30,color: Colors.amber),)),onTap: (){Navigator.pushNamed(context,  "/feedBack");}),]
          ),

        ),
      ) ,
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.black,
        onPressed: (){

          Navigator.pushNamed(context, "/AddFoodProduct");
          // food_list!.page=="food";
          },
        child:const Icon(Icons.add,color: Colors.amber,),
      ),);
  }
}
