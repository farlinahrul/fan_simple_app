import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/constant.dart';

class TextInter extends StatelessWidget {
  final double size;
  final Color? color;
  final Weightenum fontWeight;
  final String? text;
  final TextAlign? align;
  final int? maxLines;

  weightSwitch() {
    switch (fontWeight) {
      case Weightenum.thin:
        return FontWeight.w100;
      case Weightenum.light:
        return FontWeight.w300;
      case Weightenum.regular:
        return FontWeight.w400;
      case Weightenum.medium:
        return FontWeight.w500;
      case Weightenum.semibold:
        return FontWeight.w600;
      case Weightenum.bold:
        return FontWeight.w700;
      default:
        return FontWeight.w400;
    }
  }

  const TextInter({super.key, 
    required this.size,
    this.color,
    required this.fontWeight,
    this.text,
    this.align,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: align ?? TextAlign.start,
      style: GoogleFonts.inter(
        fontWeight: weightSwitch(),
        fontSize: size,
        color: color ?? null,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}
