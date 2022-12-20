import 'package:flutter/material.dart';
import 'display.dart';
import 'package:provider/provider.dart';
import '../services/provider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController _contName = TextEditingController();
  final TextEditingController _contEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _contName,
          decoration: const InputDecoration(
              hintText: 'Enter name',
              constraints: BoxConstraints(
                maxWidth: 600,
              )),
        ),
        const SizedBox(
          height: 30,
        ),
        TextField(
          controller: _contEmail,
          decoration: const InputDecoration(
              hintText: 'Enter email',
              constraints: BoxConstraints(
                maxWidth: 600,
              )),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {
            context.read<saving>().addUsers(_contEmail.text, _contName.text);
          },
          child: Text("Submit"),
          style: ElevatedButton.styleFrom(
              elevation: 7,
              minimumSize: Size(50, 40),
              backgroundColor: Colors.black87),
        ),
        SizedBox(
          height: 30,
        ),
        FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => Display()),
              ),
            );
          },
          child: Text("Show"),
        )
      ],
    ));
  }
}
