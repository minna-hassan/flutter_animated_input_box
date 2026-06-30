import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final String buttonLabel;
  final IconData buttonIcon;
  const ActionButton({
    super.key,
    required this.buttonLabel,
    required this.buttonIcon,
  });

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.widthOf(context);
    var screenHeight = MediaQuery.heightOf(context);
    return Container(
      margin: EdgeInsets.only(left: screenWidth * 0.008),
      width: screenWidth * 0.08,
      height: screenHeight * 0.04,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white10),
        color: const Color.fromARGB(222, 20, 20, 20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Icon(
              widget.buttonIcon,
              color: const Color.fromARGB(180, 158, 158, 158),
              size: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              widget.buttonLabel,
              style: TextStyle(
                fontSize: 10,
                color: const Color.fromARGB(177, 158, 158, 158),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
