import 'package:exam_project/Electronics_page.dart';
import 'package:exam_project/list.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class Elec extends StatefulWidget {

  // ignore: non_constant_identifier_names
  Cat_List cat_list;
  ElectronicsState el;
  Elec(this.cat_list,this.el, {Key? key}) : super(key: key);

  @override
  State<Elec> createState() => _ElecState();
}

class _ElecState extends State<Elec> {


  List<String> images=[
    'assets/phoneimg10.jpeg',
    'assets/phoneimg9.jpeg',
    'assets/phoneimg8.jpeg',
    'assets/phoneimg7.jpeg',
    'assets/phoneimg6.jpeg',
    'assets/phoneimg5.jpeg',
    'assets/phoneimg4.jpeg',
    'assets/phoneimg3.jpeg',
    'assets/phoneimg2.jpeg',
    'assets/phoneimg1s.jpeg',
  ];

  String imgpath='';

  @override
  Widget build(BuildContext context) {
    images.shuffle();
    imgpath=images[0];
    return (  Card(color:Colors.grey,child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          SizedBox(height: 100,width: 150, child: Image.asset(imgpath),),

          // Row(mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
              Flexible(
                child:
                Container(margin:const EdgeInsets.all(10),
                  child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children:[InkWell(
                    child: const Icon(Icons.delete),onTap: (){Cat_List.catlist.remove(widget.cat_list); widget.el.setState(() {});}),
                               ]),
                Text("Name : ${widget.cat_list.name}",style:const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                Text("Price: ${widget.cat_list.price.toString()}",style:const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                Text("Quantity: ${widget.cat_list.quantity.toString()}",style:const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),

      ],
            ),

            ),
              )],
          ),

        )
    );
  }
}




// InkWell(child:const Icon(Icons.edit),onTap: (){Navigator.pushNamed(context, "/AddProduct",arguments:{"/data":widget.cat_list} );},)


