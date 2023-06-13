import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_project/list.dart';
import 'package:flutter/material.dart';

void main() {
  return (runApp(MaterialApp(
    home: AddPage(),
  )));
}

// ignore: must_be_immutable
class AddPage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Cat_List? cat_list;
  TextEditingController namecont = TextEditingController();
  TextEditingController pricecont = TextEditingController();
  TextEditingController quantitycont = TextEditingController();

  AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      Map<String, dynamic> data =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      cat_list = data['/data'];
      namecont.text = cat_list!.name;
      pricecont.text = cat_list!.price.toString();
      quantitycont.text = cat_list!.quantity.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adding Electronic Product",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        backgroundColor: Colors.black,
      ),
      body: Container(
          color: Colors.black54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Name",
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: namecont,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Text(
                "Price",
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: pricecont,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Text(
                "Quantity",
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              TextField(
                controller: quantitycont,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (cat_list != null) {
                      final fireStore = FirebaseFirestore.instance;
                      fireStore.collection('electronics').add({
                        'name': 'nokia phone',
                        'price': 2000,
                        'quantity': 5,
                      });
                      print('sucsses');
                      cat_list!.name = namecont.text;
                      cat_list!.price = int.parse(pricecont.text);
                      cat_list!.quantity = int.parse(quantitycont.text);
                    } else if (cat_list == null) {
                      Cat_List.catlist.add(Cat_List(
                          namecont.text,
                          int.parse(pricecont.text),
                          int.parse(quantitycont.text)));
                    }
                    Navigator.pushReplacementNamed(context, "/electronics");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Background color
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(),
                  ))
            ],
          )),
    );
  }
}
