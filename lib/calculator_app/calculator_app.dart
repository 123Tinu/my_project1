import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/calculator_app/button_controller.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final ButtonController buttonController = Get.put(ButtonController());

  //
  // var result;
  //
  // //add
  //
  // add(String x, String y) {
  //
  //   int num1=int.tryParse(x) ?? 0;
  //   int num2=int.tryParse(y) ?? 0;
  //   result = num1 + num2;
  // }
  //
  //
  // sub(String x, String y) {
  //
  //   int num1=int.tryParse(x) ?? 0;
  //   int num2=int.tryParse(y) ?? 0;
  //   result = num1 - num2;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Calculator"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controller1,
                decoration: const InputDecoration(
                    hintText: "No:1", border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "No:2", border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Result :",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${buttonController.result}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        buttonController.add(
                            controller1.text, controller2.text);
                      });
                    },
                    child: const Text("+")),
                const SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        buttonController.sub(
                            controller1.text, controller2.text);
                      });
                    },
                    child: const Text("-")),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        buttonController.div(
                            controller1.text, controller2.text);
                      });
                    },
                    child: const Text("/")),
                const SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        buttonController.mul(
                            controller1.text, controller2.text);
                      });
                    },
                    child: const Text("*")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
