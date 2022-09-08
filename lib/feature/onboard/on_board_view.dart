import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vanilla_provider_application/feature/onboard/on_board_model.dart';
import 'package:vanilla_provider_application/feature/onboard/tab_indicator.dart';
import 'package:vanilla_provider_application/product/padding/page_padding.dart';
import 'package:vanilla_provider_application/product/widgets/on_board_card.dart';

part './module/start_fab_button.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);
  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skipTitle = "Skip";

  bool get _isLastPage => OnBoardModels.onBoardItems.length - 1 == _selectedIndex;
  bool get _isFirstPage => _selectedIndex == 0;

  // ----XX

  ValueNotifier<bool> isBackEnable = ValueNotifier(false);

  // ----XX
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  void _incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      _changeBackEnable(true);
      return;
    }
    _changeBackEnable(false);
    _increamentSelectedPage(value);
  }

  void _changeBackEnable(bool value) => value == isBackEnable.value ? null : isBackEnable.value = value;

  void _increamentSelectedPage([int? value]) {
    setState(() {
      if (value != null) {
        _selectedIndex = value;
      } else {
        _selectedIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(
          children: [
            Expanded(
              child: _pageViewItems(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabIndicator(selectedIndex: _selectedIndex),
                  _StartFabButton(
                    isLastPage: _isLastPage,
                    onPressed: () => _incrementAndChange(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [
        ValueListenableBuilder<bool>(
          valueListenable: isBackEnable,
          builder: (BuildContext context, bool value, Widget? child) {
            return value ? const SizedBox() : TextButton(onPressed: () {}, child: Text(_skipTitle));
          },
        ),
      ],
      leading: _isFirstPage
          ? null
          : IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chevron_left_outlined,
                color: Colors.grey,
              ),
            ),
    );
  }

  Widget _pageViewItems() {
    return PageView.builder(
      onPageChanged: (value) {
        _incrementAndChange(value);
      },
      itemCount: OnBoardModels.onBoardItems.length,
      itemBuilder: (context, index) {
        return OnBoardCard(model: OnBoardModels.onBoardItems[index]);
      },
    );
  }
}
