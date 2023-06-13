import 'package:exam_project/Food_page.dart';
import 'package:exam_project/list.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class FoodWidget extends StatefulWidget {
  // ignore: non_constant_identifier_names
  Food_List food_list;
  FoodState foodState;

  FoodWidget(this.food_list,this.foodState, {Key? key}) : super(key: key);

  @override
  State<FoodWidget> createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {

@override
  Widget build(BuildContext context) {
  List<String> assets=[
    "assets/foodimg1.jpeg",
    "assets/foodimg2.jpeg",
    "assets/foodimg3.jpeg",
    "assets/foodimg4.jpeg",
    "assets/foodimg5.jpeg",
    "assets/foodimg6.jpeg",
    "assets/foodimg7.jpeg",
    "assets/foodimg8.jpeg",
    "assets/foodimg9.jpeg",
    "assets/foodimg10.jpeg",
  ];
  assets.shuffle();
  String imgpath=assets[0];
    return (
    Card(color:Colors.grey,
        child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[

            
              SizedBox(height: 100,width: 150,child:Image.asset(imgpath)),

              Flexible(
                child: Container(margin:const EdgeInsets.all(10),child:
                  Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center,children:[
                    InkWell(child:const Icon(Icons.delete),onTap: (){ Food_List.foodlist.remove(widget.food_list);widget.foodState.setState(() {}); },),
                    InkWell(child:const Icon(Icons.edit),onTap: (){ Navigator.pushNamed(context, "/AddFoodProduct",arguments: {"foodData":widget.food_list}); },)
                  ]) ,
                    Text("Name: ${widget.food_list.name}",style:const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    Text("Price: ${widget.food_list.price.toString()}",style:const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    Text("Quantity: ${widget.food_list.quantity.toString()}",style:const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
        ])

        ),
              ),

    ])));
  }
}
