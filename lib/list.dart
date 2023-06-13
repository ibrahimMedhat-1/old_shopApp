// ignore: camel_case_types
class Cat_List{

  static List <Cat_List> catlist=[
    Cat_List("cat1",10 , 20),
    Cat_List("cat2",20 , 40),
    Cat_List("cat2",30 , 60)
  ];
String name;
int price;
int quantity;


  Cat_List(this.name,this.price,this.quantity);
  }

// ignore: camel_case_types
class Food_List{
static List<Food_List> foodlist=[
  Food_List("food1",10 , 20),
  Food_List("food2",20 , 40),
  Food_List("food2",30 , 60)
];

String name;
int price;
int quantity;
String? page;
Food_List(this.name,this.price,this.quantity,{String? page="food"}){this.page!=page;}
}