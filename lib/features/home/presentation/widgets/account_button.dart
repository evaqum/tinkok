import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final double size;

  const AccountButton({
    super.key,
    this.size = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: const ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(
            color: Color(0xFFAFF217),
            width: 1.0,
          ),
        ),
        color: Color(0xFF121212),
      ),
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          gradient: LinearGradient(
            colors: [
              Color(0xFF4D4D4D),
              Color(0xFF353535),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.person_rounded,
            color: const Color.fromARGB(181, 255, 255, 255),
            size: size - 12,
          ),
        ),
      ),
    );
  }
}
