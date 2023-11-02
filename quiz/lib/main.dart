import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
    Question("La religion la plus pratiquée à Madagascar est ?",
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
    Question("La capitale de la 1ère république malgache est ?",
        ["Antananarivo", "Tamatave", "Majunga"], 0),
    Question("Le président de la 1ère république malgache est ?",
        ["Philibert Tsiranana", "Didier Ratsiraka", "Marc Ravalomanana"], 0),
    Question("La capitale de la 2ème république malgache est ?",
        ["Antananarivo", "Tamatave", "Majunga"], 0),
    Question("Le président de la 2ème république malgache est ?",
        ["Philibert Tsiranana", "Didier Ratsiraka", "Marc Ravalomanana"], 0),
    Question("La capitale de la 3ème république malgache est ?",
        ["Antananarivo", "Tamatave", "Majunga"], 0),
    Question("Le président de la 3ème république malgache est ?",
        ["Didier Ratsiraka", "Marc Ravalomanana", "Andry Rajoelina"], 0),
    Question("La capitale de la 4ème république malgache est ?",
        ["Antananarivo", "Tamatave", "Majunga"], 0),
    Question("Le président de la 4ème république malgache est ?",
        ["Andry Rajoelina", "Marc Ravalomanana", "Toto Ramatolanjona"], 0),
  ];

  int score = 0;
  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              questions[questionIndex].question,
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: ElevatedButton(
                      child: Text(questions[questionIndex].options[0]),
                      onPressed: () {
                        _checkAnswer(context, 0);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: ElevatedButton(
                      child: Text(questions[questionIndex].options[1]),
                      onPressed: () {
                        _checkAnswer(context, 1);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: ElevatedButton(
                      child: Text(questions[questionIndex].options[2]),
                      onPressed: () {
                        _checkAnswer(context, 2);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _checkAnswer(BuildContext context, int index) {
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
    );
    ScaffoldMessenger.of(context).showSnackBar(snackAns);

    // Fanontaniana manaraka
    questionIndex++;
    // Fanontaniana farany
    if (questionIndex == questions.length) {
      // Notif amin'ny faran'ny Quiz
      final snackEnd = SnackBar(
        content: Text(
          "Fin du quiz ! Votre score est de $score sur 10.",
        ),
        action: SnackBarAction(
          label: "Recommencer",
          onPressed: () {
            // averina atomboka
            score = 0;
            questionIndex = 0;
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackEnd);
    }
  }
}

class Question {
  String question;
  List<String> options;
  int answer;

  Question(this.question, this.options, this.answer);
}
