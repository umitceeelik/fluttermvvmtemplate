import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {

  final Widget? child;

  final VoidCallback? onPressed;

  const NormalButton({super.key, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
