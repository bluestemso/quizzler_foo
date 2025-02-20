import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler Foo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black54),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quizzler Foo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Icon> scoreKeeper = [];

  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];

  int questionIndex = 0;

  // Homepage functions go here


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.black87,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  questions[questionIndex],
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              TextButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(Size.fromHeight(100)),
                  backgroundColor: WidgetStatePropertyAll(Colors.green),
                  foregroundColor: WidgetStatePropertyAll(Colors.white70),
                  textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 30)),
                ),
                onPressed: () {
                  setState(() {
                    questionIndex++;
                  });
                },
                child: Text("TRUE"),
              ),
              SizedBox(height: 40),
              TextButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(Size.fromHeight(100)),
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
                  foregroundColor: WidgetStatePropertyAll(Colors.white70),
                  textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 30)),
                ),
                onPressed: () {
                  setState(() {
                    questionIndex++;
                  });
                },
                child: Text("FALSE"),
              ),
              SizedBox(height: 40),
              Row(
                children: scoreKeeper
              )
            ],
          ),
        ),
      ),
    );
  }
}
