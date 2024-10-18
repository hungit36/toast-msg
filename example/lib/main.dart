import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toast_msg/toast_msg_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  void initState() {
    super.initState();
  }

  final _focusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () => _focusNode.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body:  ToastMsgMain(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            // positionValue: 200,
            child:  Column(
              children: [
                const Expanded(
                  child: Center(
                  child: Text('Hello!'),
                        ),
                ),
                TextField(autofocus: true, decoration: const InputDecoration(border: OutlineInputBorder()), focusNode: _focusNode,)
              ],
            )),
          floatingActionButton: ElevatedButton(onPressed: (){
            ToastMsgStream.instance.showToast(
              ToastData(
                // title: 'Test Msg', 
                customTitle: _buildCustomTitle(),
                backgroundColor: Colors.green, 
                titleStyle: const TextStyle(color: Colors.white),
                iconWidget: const Icon(Icons.info)
              ),
            );
          }, child: const Icon(Icons.publish)),
        ),
      ),
    );
  }

  Widget _buildCustomTitle() {
    return Text.rich(
                TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    const TextSpan(
                      text: 'Msg content',
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: 'click here!',
                      style: const TextStyle(color: Colors.red),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint('click here! tapped');
                        },
                    )
                  ],
                ),
              );
  }
}
