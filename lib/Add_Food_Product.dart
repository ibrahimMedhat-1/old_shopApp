import 'list.dart';
import 'package:flutter/material.dart';

class AddFoodProduct extends StatefulWidget {
  const AddFoodProduct({Key? key}) : super(key: key);

  @override
  State<AddFoodProduct> createState() => _AddFoodProductState();
}

class _AddFoodProductState extends State<AddFoodProduct> {
  // ignore: non_constant_identifier_names
  Food_List? food_list;
  TextEditingController namecont= TextEditingController();
  TextEditingController pricecont= TextEditingController();
  TextEditingController quantitycont= TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(ModalRoute.of(context)!.settings.arguments!=null) {
      Map<String, dynamic> data =
      ModalRoute
          .of(context)!
          .settings
          .arguments as Map<String, dynamic>;
      food_list = data['foodData'];
      namecont.text = food_list!.name;
      pricecont.text = food_list!.price.toString();
      quantitycont.text = food_list!.quantity.toString();
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Adding Food Product",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),backgroundColor: Colors.black,),
      body: Container(color: Colors.black54,
          child:Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
            const Text("Name",style: TextStyle(color: Colors.amber,fontSize: 25,fontWeight: FontWeight.bold),),
            TextField(controller: namecont,style: const TextStyle(color: Colors.white,fontSize: 20),),
            const Text("Price",style: TextStyle(color: Colors.amber,fontSize: 25,fontWeight: FontWeight.bold),),
            TextField(controller: pricecont,style: const TextStyle(color: Colors.white,fontSize: 20),),
            const Text("Quantity",style: TextStyle(color: Colors.amber,fontSize: 25,fontWeight: FontWeight.bold),),
            TextField(controller: quantitycont,style: const TextStyle(color: Colors.white,fontSize: 20),),
            ElevatedButton(onPressed: (){

              if(food_list!=null){
                food_list!.name=namecont.text;
                food_list!.price=int.parse(pricecont.text);
                food_list!.quantity=int.parse(quantitycont.text);
              }else if(food_list==null) {
                Food_List.foodlist.add(Food_List(
                    namecont.text, int.parse(pricecont.text),
                    int.parse(quantitycont.text)));
              }
              Navigator.pushReplacementNamed(context, "/food");
            },style: ElevatedButton.styleFrom(backgroundColor: Colors.black),child:const Text("Save",style: TextStyle(color: Colors.white),))
          ],)
      ),
    );
  }
}
