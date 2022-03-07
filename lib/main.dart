import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/getX_controller/home_controller.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("GetX Demo",
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetX<DataController>(
                init: DataController(),
                builder: (dataController) {
                  if (dataController.isLoading.value == true) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                        itemCount: dataController.list.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Text(
                              dataController.list[index].email,
                              style: const TextStyle(fontSize: 22),
                            ),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
