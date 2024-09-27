import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/view_models/view_models.dart';
import 'presentation/views/home/home_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation MVVM App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      // home: const AnimatedListScreen(),
    );
  }
}
