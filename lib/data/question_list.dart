import 'package:quiz_app/model/question_model.dart';


List<QuestionModel> questions = [
  QuestionModel(
    "Which of the following is not an OOP language?",
    {
      "Java": false,
      "CPP": false,
      "C": true,
      "Python": false,
    },
  ),
  QuestionModel("Which company's employees invented STLs?", {
    "Microsoft": false,
    "IBM": false,
    "Apple": false,
    "Hewlett Packard": true,
  }),
  QuestionModel("What is a function that calls itself called?", {
    "Inherited Function": false,
    "Recursive Function": true,
    "Abstract Function": false,
    "Virtual Function": false,
  }),
  QuestionModel("Who is deemed as the father of computers?", {
    "Alan Turing": false,
    "John Hopkins": false,
    "Charles Babbage": true,
    "Davidson Barnum": false,
  }),
  QuestionModel("Which company produced the first computer?", {
    "IBM": true,
    "Microsoft": false,
    "Sun Microsystems": false,
    "Apple": false,
  }),
  QuestionModel("Which company invented TerraVision?", {
    "Google": false,
    "Microsoft": false,
    "ART+COM": true,
    "Sun Microsystems": false,
  }),
  QuestionModel(
      "The first website hosted on the World Wide Web?", {
    "Bloomberg": false,
    "Stanford Linear Accelerator Center": false,
    "World Wide Web Virtual Library": false,
    "CERN": true,
  }),
  QuestionModel("Where was AI given its modern meaning?", {
    "Massachusetts Institute of Technology": false,
    "University of Southern California": false,
    "University of Dartmouth": true,
    "Princeton University": false,
  }),
  QuestionModel(
      "What was the first ever Apple product called?",
      {
        "Macintosh": false,
        "The Apple Cube": false,
        "Apple I": true,
        "Byte": false,
      }),
  QuestionModel(
      "This is not a type of Constructor in C++ :", {
    "Default Constructor": false,
    "Friend Constructor": true,
    "Parameterized Constructor": false,
    "Copy Constructor": false,
  }),
];