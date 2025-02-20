import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

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

  void checkAnswer(bool userPickedAnswer) {
    if (quizBrain.isFinished()) {
      Alert(context: context, title: 'Finished!', desc: 'You\'ve reached the end of the quiz.').show();
      quizBrain.reset();
      scoreKeeper = [];
    } else {
      if (quizBrain.getQuestionAnswer() == userPickedAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
    }
  }

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox()
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextButton(
                    style: ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(Size.fromHeight(100)),
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                      foregroundColor: WidgetStatePropertyAll(Colors.white70),
                      textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 30)),
                    ),
                    child: Text("TRUE"),
                    onPressed: () {
                      checkAnswer(true);
                      setState(() {
                        quizBrain.nextQuestion();
                      });
                    },
                  ),
                  SizedBox(height: 40),
                  TextButton(
                    style: ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(Size.fromHeight(100)),
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      foregroundColor: WidgetStatePropertyAll(Colors.white70),
                      textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 30)),
                    ),
                    child: Text("FALSE"),
                    onPressed: () {
                      checkAnswer(false);
                      setState(() {
                        quizBrain.nextQuestion();
                      });
                    },
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: scoreKeeper
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
