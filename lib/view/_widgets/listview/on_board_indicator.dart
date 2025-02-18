import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/components/list-view/indicator_list_view.dart';

class OnBoardIndicator extends StatelessWidget {

  final int itemCount;
  final int currentIndex;

  const OnBoardIndicator({super.key, required this.itemCount, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return IndicatorListView(
      currentIndex: currentIndex,
      itemCount: itemCount,
      onListItem: (index) {
        return FlutterLogo();
      }
    );
  }
}