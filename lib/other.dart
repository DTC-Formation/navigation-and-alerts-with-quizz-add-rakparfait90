import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizz App',
      home: MyQuiz(),
    );
  }
}

class MyQuiz extends StatefulWidget {
  const MyQuiz({super.key});

  @override
  State<MyQuiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  bool answered = false;
  bool showResult = false;

  List<Question> questions = [
    Question("Le premier roi de Madagascar est ?",
        ["Andrianampoinimerina", "Radama Ier", "Ranavalona Ière"], 0),
    Question("La capitale de Madagascar est ?",
        ["Antananarivo", "Toamasina", "Mahajanga"], 0),
    Question("La langue officielle de Madagascar est ?",
        ["Malagasy", "Français", "Anglais"], 0),
    Question("La population de Madagascar est d'environ ?",
        ["27 millions", "30 millions", "33 millions"], 0),
    Question("La superficie de Madagascar est d'environ ?",
        ["587 040 km²", "600 000 km²", "620 000 km²"], 0),
    Question("Le point culminant de Madagascar est ?",
        ["Maromokotro", "Isalo", "Andringitra"], 0),
    Question("La monnaie de Madagascar est ?",
        ["Ariary", "Franc malgache", "Euro"], 0),
    Question("La religion la plus pratiquée à Madagascar ?",
        ["Christianisme", "Islam", "Animisme"], 0),
    Question("La couleur nationale de Madagascar est ?",
        ["Rouge", "Vert", "Jaune"], 0),
    Question("L'hymne national de Madagascar est ?",
        ["Ry Tanindrazanay malala ô", "Iarivo la belle", "Merina"], 0),
    Question("Le drapeau de Madagascar est composé de ?",
        ["Rouge, blanc, vert", "Rouge, jaune, vert", "Bleu, blanc, rouge"], 0),
    Question("Le symbole national de Madagascar est ?",
        ["Le zébu", "Le baobab", "L'arbre du voyageur"], 0),
    Question("Le fruit national de Madagascar est ?",
        ["La mangue", "La banane", "La noix de coco"], 0),
    Question("L'animal national de Madagascar est ?",
        ["Le fossa", "Le lémur", "Le camaleon"], 0),
    Question("La capitale de la 1è république malgache est ?",
        ["Antananarivo", "Tamatave", "Majunga"], 0),
    Question("Le président de la 1è république malgache est ?",
        ["Philibert Tsiranana", "Didier Ratsiraka", "Marc Ravalomanana"], 0),
    Question("La capitale de la 2ème république malgache est ?",
        ["Antananarivo", "Tamatave", "Majunga"], 0),
    Question("Le président de la 2è république malgache est ?",
        ["Philibert Tsiranana", "Didier Ratsiraka", "Marc Ravalomanana"], 0),
    Question("La capitale de la 3è république malgache est ?",
        ["Antananarivo", "Tamatave", "Majunga"], 0),
    Question("Le président de la 3è république malgache est ?",
        ["Didier Ratsiraka", "Marc Ravalomanana", "Andry Rajoelina"], 0),
    Question("La capitale de la 4è république malgache est ?",
        ["Antananarivo", "Tamatave", "Majunga"], 0),
    Question("Le président de la 4è république malgache est ?",
        ["Andry Rajoelina", "Marc Ravalomanana", "Toto Ramatolanjona"], 0),
  ];

  int score = 0;
  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Quizz',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Center(
            child: Text(
              'Score : $score',
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              questionIndex < questions.length
                  ? questions[questionIndex].question
                  : "Fin du quiz !",
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
          if (questionIndex < questions.length)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.75,
                      child: ElevatedButton(
                        onPressed:
                            answered ? null : () => _checkAnswer(context, 0),
                        child: Text(questions[questionIndex].options[0]),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.75,
                      child: ElevatedButton(
                        onPressed:
                            answered ? null : () => _checkAnswer(context, 1),
                        child: Text(questions[questionIndex].options[1]),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.75,
                      child: ElevatedButton(
                        onPressed:
                            answered ? null : () => _checkAnswer(context, 2),
                        child: Text(questions[questionIndex].options[2]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          // SizedBoxScore widget
          if (showResult)
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Votre score final est de $score sur ${questions.length}.",
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          score = 0;
                          questionIndex = 0;
                          answered = false;
                          showResult = false;
                        });
                      },
                      child: const Text("Recommencer"),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _checkAnswer(BuildContext context, int index) {
    if (questionIndex < questions.length) {
      if (questions[questionIndex].answer == index) {
        score++;
      }

      // Fampisehoana notif
      final snackAns = SnackBar(
        content: Text(
          index == questions[questionIndex].answer
              ? "Bonne réponse !"
              : "Mauvaise réponse !",
        ),
        duration: const Duration(milliseconds: 500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackAns);

      // Fanontaniana manaraka
      questionIndex++;

      setState(() {
        if (questionIndex < questions.length) {
          answered = false;
          // Réinitialiser la variable answered pour la prochaine question
        } else {
          answered = true;
          showResult = true;
        }
      });
    }
  }
}

class Question {
  String question;
  List<String> options;
  int answer;

  Question(this.question, this.options, this.answer);
}
