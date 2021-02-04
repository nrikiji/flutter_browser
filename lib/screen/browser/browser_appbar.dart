part of 'browser_screen.dart';

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            /// 更新ボタン
            Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: InkWell(
                child: Icon(Icons.refresh, size: 28),
                excludeFromSemantics: true,
                onTap: context.read(_screenController).reload,
              ),
            ),

            /// URL表示
            Consumer(
              builder: (context, watch, _) {
                final url = watch<BrowserScreenState>(_screenController.state)
                    .currentUrl;
                if (url == null) {
                  return Expanded(child: SizedBox.shrink());
                }

                return Expanded(
                  child: SelectableText(
                    url,
                    showCursor: true,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    toolbarOptions: ToolbarOptions(
                      copy: true,
                      selectAll: true,
                    ),
                  ),
                );
              },
            ),

            /// 設定ボタン
            Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: InkWell(
                child: Icon(Icons.settings, size: 28),
                excludeFromSemantics: true,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
