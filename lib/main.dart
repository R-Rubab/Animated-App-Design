import 'core/exports_file/export.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation MVVM App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
      // home: const AnimatedListScreen(),
    );
  }
}
