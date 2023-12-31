import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import '../helper/constant.dart';
import 'text/text_inter.dart';

class PrimaryButton extends StatelessWidget {
  final Widget? child;
  final Gradient? gradient;
  final double width;
  final double? height;
  final void Function()? onPressed;
  final double? borderRadius;
  final bool enabled;
  final bool shadowed;
  final double marginHorizontal;
  final String? title;
  final bool reverse;

  const PrimaryButton({
    Key? key,
    this.title,
    this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 48,
    this.onPressed,
    this.borderRadius,
    this.enabled = true,
    this.shadowed = true,
    this.reverse = false,
    this.marginHorizontal = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
      decoration: BoxDecoration(
        gradient: gradient ??
            LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              colors: enabled
                  ? <Color>[
                      reverse
                          ? Resources.color.white
                          : Resources.color.subBrand,
                      reverse ? Resources.color.white : Resources.color.subBrand
                    ]
                  : <Color>[Resources.color.grey, Resources.color.grey],
            ),
        boxShadow: [
          enabled && shadowed
              ? BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.5),
                  blurRadius: 1.5,
                )
              : BoxShadow(color: Colors.transparent),
        ],
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          onTap: enabled ? onPressed ?? () {} : null,
          child: Center(
              child: child ??
                  TextInter(
                      size: 16,
                      color: Resources.color.inverse,
                      fontWeight: Weightenum.semibold,
                      text: title.toString())),
        ),
      ),
    );
  }
}
