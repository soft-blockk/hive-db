import 'package:flutter/material.dart';
import './screen/form_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './model/model.dart';
import 'package:provider/provider.dart';
import './services/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(usersAdapter());
  await Hive.openBox<users>('users');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => saving(),
      child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue.shade300,
            title: const Text('local storage'),
          ),
          body: FormScreen(),
        ),
      ),
    );
  }
}
