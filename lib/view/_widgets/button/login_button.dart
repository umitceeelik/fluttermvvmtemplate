import 'package:flutter/material.dart';

import '../../../core/components/button/icon_button.dart';

class MVVMLoginButton extends StatelessWidget {
  final Function(String data)? onComplete;

  const MVVMLoginButton({super.key, this.onComplete});

  @override
  Widget build(BuildContext context) {
    return IconNormalButton(
      icon: Icons.login,
      onPressed: () {
        onComplete?.call('OKEY');
      },
    ); 
  }
}