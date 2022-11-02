import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:objectboxapp/model/userModel.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
            headline4: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        colorScheme:
            const ColorScheme.light(primary: CupertinoColors.systemGrey4),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Users> _users = [
    Users(email: 'user1@gmail.com', name: 'user1'),
    Users(email: 'user2@gmail.com', name: 'user2'),
    Users(email: 'user3@gmail.com', name: 'user3'),
    Users(email: 'user4@gmail.com', name: 'user4'),
    Users(email: 'user5@gmail.com', name: 'user5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Object box',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        body: SizedBox(
          child: ReorderableListView.builder(
              itemBuilder: (_, index) {
                var data = _users[index];
                return ListTile(
                  key: ValueKey(index),
                  title: Text(data.name),
                  subtitle: Text(data.email),
                );
              },
              itemCount: _users.length,
              onReorder: (old, fresh) {
                final index = fresh > old ? fresh - 1 : fresh;
                final user = _users.removeAt(old);
                _users.insert(index, user);
              }),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
