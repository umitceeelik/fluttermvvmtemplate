import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_view.dart';
import 'package:fluttermvvmtemplate/core/components/container/random_color_container.dart';
import 'package:fluttermvvmtemplate/core/components/text/auto_locale_text.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/view/_product/_constants/image_path_svg.dart';
import 'package:fluttermvvmtemplate/view/_product/_widgets/avatar/on_board_circle.dart';
import 'package:fluttermvvmtemplate/view/authenticate/onboard/model/on_board_model.dart';
import 'package:fluttermvvmtemplate/view/authenticate/onboard/viewModel/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) =>
          Scaffold(
        body: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            children: [
              Spacer(flex: 1),
              Expanded(
                flex: 5,
                child: buildPageView(viewModel),
              ),
              Expanded(flex: 2, child: buildRowFooter(viewModel, context)),
            ],
          ),
        ),
      ),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      itemBuilder: (context, index) =>
          buildColumnBody(context, viewModel.onBoardItems[index]),
      onPageChanged: (value) {
        viewModel.changeCurrentIndex(value);
      },
      itemCount: viewModel.onBoardItems.length,
    );
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildListViewCircles(viewModel),
        // OnBoardIndicator(itemCount: 3, currentIndex: 0),
        Expanded(child: Center(child: Observer(builder: (_) {
          return Visibility(
            visible: viewModel.isLoading,
            child: CircularProgressIndicator()
          );
        }))),
        buildFloatingActionButtonSkip(context, viewModel),
      ],
    );
  }

  ListView buildListViewCircles(OnBoardViewModel viewModel) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Observer(builder: (_) {
            return OnBoardCircle(
              isSelected: viewModel.currentIndex == index,
            );
          });
        });
  }

  FloatingActionButton buildFloatingActionButtonSkip(BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
      backgroundColor: context.colors.onSurface,
      child: Icon(Icons.arrow_circle_right_outlined,
          color: context.colors.secondary),
      onPressed: () => viewModel.completeToOnBoard(),
    );
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSvgPicture(model.imagePath)),
        buildColumnDescription(context, model),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        buildAutoLocaleTextTitle(model, context),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: buildAutoLocaleTextDescription(model, context),
        ),
      ],
    );
  }

  AutoLocaleText buildAutoLocaleTextTitle(
      OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.title,
      style: context.theme.textTheme.displayLarge?.copyWith(
          fontWeight: FontWeight.bold, color: context.colors.onSecondary),
    );
  }

  AutoLocaleText buildAutoLocaleTextDescription(
      OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.description,
      textAlign: TextAlign.center,
      style: context.theme.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w100, color: context.colors.onSecondary),
    );
  }

  SvgPicture buildSvgPicture(String path) {
    return SvgPicture.asset(path);
  }
}
