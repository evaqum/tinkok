import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProBadge extends StatelessWidget {
  final String? textOverride;

  const ProBadge({
    super.key,
    this.textOverride,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(
            color: Color(0xFFAFF217),
            width: 2.0,
          ),
        ),
        color: Colors.black,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 2.0,
      ),
      child: Text(
        textOverride ?? 'PRO',
        style: GoogleFonts.lexendZetta(
          height: 1.0,
          letterSpacing: -2,
          fontSize: 8.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
