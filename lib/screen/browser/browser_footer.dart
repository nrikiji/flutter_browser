part of 'browser_screen.dart';

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            /// 戻るボタン
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                child: InkWell(
                  child: Icon(Icons.keyboard_arrow_left, size: 28),
                  excludeFromSemantics: true,
                  onTap: context.read(_screenController).goBack,
                ),
              ),
            ),

            /// 進むボタン
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                child: InkWell(
                  child: Icon(Icons.keyboard_arrow_right, size: 28),
                  excludeFromSemantics: true,
                  onTap: context.read(_screenController).goForward,
                ),
              ),
            ),

            /// スペーサー
            Expanded(flex: 2, child: SizedBox.shrink()),

            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                child: InkWell(
                  child: Icon(Icons.close, size: 28),
                  excludeFromSemantics: true,
                  onTap: () => UtilHelper.showStartupScreen(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}