import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_car/database/db_helper.dart';

import '../../model/car.dart';

class AddScreen extends StatefulWidget {
  final Car? car;

  AddScreen({this.car});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DbHelper db = DbHelper();
  TextEditingController? name;
  TextEditingController? description;
  TextEditingController? price;
  TextEditingController? year;

  @override
  void initState() {
    // TODO: implement initState
    name =
        TextEditingController(text: widget.car == null ? '' : widget.car!.name);

    description = TextEditingController(
        text: widget.car == null ? '' : widget.car!.description);

    price = TextEditingController(
        text: widget.car == null ? '' : widget.car!.price.toString());

    year = TextEditingController(
        text: widget.car == null ? '' : widget.car!.year.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Car'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              maxLines: 4,
              controller: description,
              decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: price,
              decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: year,
              decoration: InputDecoration(
                  labelText: 'Year',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              child: (widget.car == null)
                  ? Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
              onPressed: () {
                actionCar();
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> actionCar() async {
    if (widget.car != null) {
      //update
      await db.updateCar(Car(
          id: widget.car!.id,
          name: name!.text,
          description: description!.text,
          price: price!.text,
          year: year!.text));

      Navigator.pop(context, 'update');
    } else {
      //insert
      await db.saveCar(Car(
        name: name!.text,
        description: description!.text,
        price: price!.text,
        year: year!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}
