import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securestorage/controller/mycontroller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyBodyPage(),
    );
  }
}

final MyController _controller = Get.find();
TextEditingController textEditingController = TextEditingController();

class MyBodyPage extends StatelessWidget {
  const MyBodyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: TextField(
              controller: textEditingController,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: OutlinedButton(
              onPressed: () {
                _controller.setUsrname(textEditingController.text);
                _controller.setListItems(['a', 'b', 'c', 'd']);
              },
              child: const Text('Save data'),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Obx(
              () => Text(
                'Values : ${_controller.myvalue.value} \n List values : ${_controller.list.value} \n',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: OutlinedButton(
              onPressed: () async {
                var a = await _controller.getUsername();
                print(a);
                var b = await _controller.getListItems();
                print(b);
              },
              child: const Text('Get data'),
            ),
          ),
        ],
      ),
    );
  }
}
