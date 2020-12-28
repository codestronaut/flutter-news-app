part of 'pages.dart';

class SettingsPage extends StatelessWidget {
  static const String settingsTitle = 'Settings';

  Widget _buildSettingList(BuildContext context) {
    return ListView(
      children: [
        Material(
          child: ListTile(
            title: Text('Dark Theme'),
            trailing: Switch.adaptive(
              value: false,
              onChanged: (value) {
                defaultTargetPlatform == TargetPlatform.iOS
                    ? showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('Coming Soon!'),
                            content: Text('This feature will be coming soon!'),
                            actions: [
                              CupertinoDialogAction(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      )
                    : showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Comming Soon!'),
                            content: Text('This feature will be coming soon!'),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: _buildSettingList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: _buildSettingList(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
