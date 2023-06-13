import 'package:exam_project/Add_Food_Product.dart';
import 'package:exam_project/list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Adding_electro_Product.dart';
import 'Electronics_page.dart';
import 'Food_page.dart';
import 'feedBack.dart';

// import 'list.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return (runApp(MaterialApp(
    initialRoute: "/home",
    routes: {
      "/home": (context) => MyApp(),
      "/electronics": (context) => const Electronics(),
      "/food": (context) => const Food(),
      "/AddProduct": (context) => AddPage(),
      "/AddFoodProduct": (context) => const AddFoodProduct(),
      "/feedBack": (context) => const FeedBack(),
    },
    debugShowCheckedModeBanner: false,
  )));
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  // ignore: non_constant_identifier_names
  Cat_List? cat_list;

  MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: non_constant_identifier_names
  Food_List? food_list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.black54,
        height: 900,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //electronics
              InkWell(
                child: Card(
                    color: Colors.black54,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("\n Electronics\n",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber))
                        ])),
                onTap: () {
                  Navigator.pushNamed(context, "/electronics");
                },
              ),
              //food
              InkWell(
                child: Card(
                    color: Colors.black54,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "\nFood\n",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber),
                          ),
                        ])),
                onTap: () {
                  Navigator.pushNamed(context, "/food");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
