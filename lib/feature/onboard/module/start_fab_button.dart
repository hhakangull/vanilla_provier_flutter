part of '../on_board_view.dart';

class _StartFabButton extends StatelessWidget {
  const _StartFabButton({required this.isLastPage, this.onPressed});
  final String _floatingButtonLastIndex = "Start";
  final String _floatingButtonIndex = "Next";
  final bool isLastPage;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Text(isLastPage ? _floatingButtonLastIndex : _floatingButtonIndex),
    );
  }
}
