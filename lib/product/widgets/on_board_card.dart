import 'package:flutter/material.dart';
import 'package:vanilla_provider_application/feature/onboard/on_board_model.dart';

class OnBoardCard extends StatelessWidget {
  const OnBoardCard({super.key, required this.model});
  final OnBoardModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          model.title,
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(model.description),
        Image.asset(model.imageWithPath),
      ],
    );
  }
}
