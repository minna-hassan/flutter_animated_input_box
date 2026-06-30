import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation_of_double/action_buttons.dart';
import 'package:flutter_animation_of_double/gradient_border_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  FocusNode focusNode = FocusNode();
  List<Color> gradient = [
    Color.fromARGB(255, 255, 164, 92),
    Color.fromARGB(255, 230, 209, 188),
    Color.fromARGB(255, 205, 185, 244),
    Color.fromARGB(255, 157, 107, 255),
    Color.fromARGB(255, 111, 76, 255),
  ];
  bool isExpanded = false;
  double value = 0.0;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animationController.addListener(() {
      setState(() {
        value = animationController.value * 2 * pi;
      });
    });
    focusNode.addListener(() {
      setState(() {
        isExpanded = focusNode.hasFocus;
        if (isExpanded) {
          animationController.repeat();
        } else {
          animationController.stop();
        }
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.widthOf(context);
    var screenHeight = MediaQuery.heightOf(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 4, 4),

      body: Center(
        child: CustomPaint(
          painter: GradientBorderPainter(
            blurRadius: 20,
            colorList: gradient,
            rotationAngle: value,
          ),
          child: AnimatedContainer(
            curve: Curves.fastEaseInToSlowEaseOut,
            clipBehavior: Clip.antiAlias,
            duration: const Duration(seconds: 2),
            width: screenWidth * 0.4,
            height: isExpanded ? screenHeight * 0.2 : screenHeight * 0.14,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    maxLines: null,
                    cursorColor: Color.fromARGB(255, 248, 246, 246),

                    focusNode: focusNode,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Type something...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ActionButton(
                            buttonLabel: "Attachments",
                            buttonIcon: Icons.cloud_upload,
                          ),
                          ActionButton(
                            buttonLabel: "Microphone",
                            buttonIcon: Icons.mic_none_outlined,
                          ),
                        ],
                      ),
                      CustomPaint(
                        painter: GradientBorderPainter(
                          colorList: gradient,
                          rotationAngle: value,
                          blurRadius: 0,
                        ),
                        child: Container(
                          width: screenWidth * 0.03,
                          height: screenHeight * 0.04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: GestureDetector(
                            onTap: () => focusNode.unfocus(),
                            child: Icon(
                              Icons.send,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
