import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:google_fonts/google_fonts.dart';

import './data/question_list.dart';
import './screens/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shreeya Chatterji',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = const Color(0xFF252c4a);
  Color secondColor = const Color(0xFF117eeb);

  PageController? _controller = PageController(initialPage: 0);

  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = const Color(0xFF117eeb);
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Container(
              child: Text(
                'Computer Quiz',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),

        // backgroundColor: mainColor,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.black, Colors.blue],
          )),
          child: Padding(
            padding: const EdgeInsets.only(top:80, left: 20, right: 20),
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller!,
              onPageChanged: (page) {
                setState(() {
                  isPressed = false;
                });
              },
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Question ${index + 1}/${questions.length}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 28.0,
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                            height: 8.0,
                            thickness: 1.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            questions[index].question!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                            ),
                          ),
                          const SizedBox(
                            height: 35.0,
                          ),
                          for (int i = 0; i < questions[index].answer!.length; i++)
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 12.0),
                              child: MaterialButton(
                                shape: const StadiumBorder(),
                                color: isPressed
                                    ? questions[index]
                                            .answer!
                                            .entries
                                            .toList()[i]
                                            .value
                                        ? isTrue
                                        : isWrong
                                    : secondColor,
                                padding: const EdgeInsets.symmetric(vertical: 18.0),
                                onPressed: isPressed
                                    ? () {}
                                    : () {
                                        setState(() {
                                          isPressed = true;
                                        });
                                        if (questions[index]
                                            .answer!
                                            .entries
                                            .toList()[i]
                                            .value) {
                                          score += 10;
                                          print(score);
                                        }
                                      },
                                child: Text(questions[index].answer!.keys.toList()[i],
                                    style: const TextStyle(color: Colors.white)),
                              ),
                            ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton(
                                onPressed: isPressed
                                    ? index + 1 == questions.length
                                        ? () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ResultScreen(score)));
                                          }
                                        : () {
                                            _controller!.nextPage(
                                                duration:
                                                    const Duration(milliseconds: 500),
                                                curve: Curves.linear);

                                            setState(() {
                                              isPressed = false;
                                            });
                                            padding: const EdgeInsets.only(top: 89);

                                  // Text('Shreeya Chatterji (102103447)',
                                  // style: TextStyle(
                                  // fontSize: 18,
                                  // color: Colors.white,
                                  // ),
                                  // ),
                                  // textAlign: TextAlign.center,
                                  // style: GoogleFonts.lato(
                                  // textStyle: TextStyle(fontSize: 30),
                                  // ),
                                  }
                                    : null,
                                style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Colors.transparent,
                                  side: BorderSide(color: Colors.white54, width: 3),
                                ),
                                child: Text(
                                  index + 1 == questions.length
                                      ? "See Result"
                                      : "Next Question",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              ],

                          ),


                        ],
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child:
                        Container(
                          padding: EdgeInsets.only(top: 85),
                            child:
                            Text('Shreeya Chatterji (102103447)',
                              style: GoogleFonts.dmSans(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ),

                      ),

                    ],
                  ),

                );
              },
            ),

          ),
        ));
  }
}
