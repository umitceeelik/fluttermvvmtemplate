import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';

class OnBoardCircle extends StatelessWidget {
  final bool isSelected;
  const OnBoardCircle({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: context.paddingLow,
        child: CircleAvatar(
          radius: isSelected
              ? context.width * 0.015
              : context.width * 0.01,
          backgroundColor: context.colors.onError.withValues(
            alpha: isSelected ? 1 : 0.2,
          ),
        ));
  }
}
