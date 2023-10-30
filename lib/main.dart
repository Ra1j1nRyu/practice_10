import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dio Example'),
        ),
        body: const Center(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dio = Dio();
  String data = '';

  void fetchData() async {
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
      setState(() {
        data = response.data.toString();
      });
    } catch (e) {
      setState(() {
        data = 'Error: $e';
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}
