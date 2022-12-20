import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_app/services/provider.dart';
import 'package:provider/provider.dart';
import '../services/provider.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  final TextEditingController _contName = TextEditingController();
  final TextEditingController _contEmail = TextEditingController();
  @override
  void dispose() {
    Hive.box('users').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<saving>().value;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black87),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: data.map((e) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(e.email),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(e.password),
                  ],
                );
              }).toList(),
            ),
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
                context
                    .read<saving>()
                    .updateUser(data[0], _contName.text, _contEmail.text);
              },
              child: Text("edit user"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<saving>().removeuser(data[0]);
              },
              child: Text("delete user"),
              style: ElevatedButton.styleFrom(
                elevation: 10,
                backgroundColor: Colors.redAccent.shade400,
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
