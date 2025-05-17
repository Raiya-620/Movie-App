import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? size;
  ModifiedText({this.color, this.size, this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text!, style: GoogleFonts.roboto(color: color, fontSize: size));
  }
}
