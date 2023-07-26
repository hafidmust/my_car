import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_car/database/db_helper.dart';
import 'package:my_car/model/car.dart';
import 'package:my_car/ui/add/add_screen.dart';
import 'package:my_car/ui/authentication/signin_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final auth = FirebaseAuth.instance;
  List<Car> listCar = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    // TODO: implement initState
    _getAllCar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text("My Car")),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Exit App"),
                          titleTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  auth.signOut().then((value) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SigninScreen(),
                                      ),
                                    );
                                  });
                                },
                                child: Text("Yes")),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("No")),
                          ],
                          content: Text("Are you sure to logout ?"),
                        );
                      });
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _openFormCreate();
          },
        ),
        body: ListView.builder(
            itemCount: listCar.length,
            itemBuilder: (context, index) {
              Car car = listCar[index];
              return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListTile(
                    leading: Icon(
                      Icons.car_rental,
                      size: 50,
                    ),
                    title: Text("Name: ${car.name}"),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                          ),
                          child: Text("Desc: ${car.description}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                          ),
                          child: Text("Price: Rp.${car.price}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                          ),
                          child: Text("Year: ${car.year}"),
                        )
                      ],
                    ),
                    trailing: FittedBox(
                      fit: BoxFit.fill,
                      child: Row(children: [
                        IconButton(
                            onPressed: () {
                              _openFormUpdate(car);
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              _deleteCar(car, index);
                            },
                            icon: Icon(Icons.delete))
                      ]),
                    ),
                  ));
            }),
      ),
    );
  }

  Future<void> _getAllCar() async {
    var list = await db.getCars();

    setState(() {
      listCar.clear();
      list!.forEach((car) {
        listCar.add(Car.fromMap(car));
      });
    });
  }

  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddScreen()));
    if (result == 'save') {
      await _getAllCar();
    }
  }

  Future<void> _openFormUpdate(Car car) async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddScreen(car: car)));
    if (result == 'update') {
      await _getAllCar();
    }
  }

  Future<void> _deleteCar(Car car, int position) async {
    await db.deleteCar(car.id!);
    setState(() {
      listCar.removeAt(position);
    });
  }
}
