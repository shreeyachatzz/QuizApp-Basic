import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatefulWidget {
  final int score;

  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
{
  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color(0xFF252c4a);
    return Scaffold(
        backgroundColor: mainColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Congratulations",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold ,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const Text(
                "Your Score:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400 ,
                ),
              ),

              const SizedBox(height: 50.0),
              Text(
                  "${widget.score}",
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                  ),
              ),
              const SizedBox(height: 60.0,),
              MaterialButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
              },
                elevation: 0.0,
              color: Colors.deepPurple,
                textColor: Colors.white,
              child: const Text("Repeat the Quiz"),
              ),

              Container(
                  alignment: Alignment.bottomCenter,
                  child:
                  Container(
                    padding: EdgeInsets.only(top: 95),
                    child:
                    Text('                  App By:\nShreeya Chatterji (102103447)',
                      style: GoogleFonts.dmSans(
                        textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                     )
                    ),
                  )
              ),

            ],
          ),
        ));
  }
}
