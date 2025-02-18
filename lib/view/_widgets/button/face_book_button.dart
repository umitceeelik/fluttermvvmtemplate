import 'package:flutter/material.dart';

import '../../../core/components/button/title_text_button.dart';

class FaceBookButton extends StatelessWidget {
  final Function(FaceBookModel? data, {String? errorMessage})? onComplete;

  const FaceBookButton({super.key, this.onComplete});

  @override
  Widget build(BuildContext context) {
    return TitleTextButton(
      text: 'Facebook Login',
      onPressed: () {
        final isLengthSixCharacter = '1234567'.length == 6;

        if (isLengthSixCharacter) {
          onComplete?.call(FaceBookModel(token: '123456', mail: 'adas'));
        } else {
          onComplete?.call(null, errorMessage: 'Facebook user not found');
        }
      },
    );
  }
}

class FaceBookModel {
  final String? token;
  final String? mail;

  FaceBookModel({this.token, this.mail});
}