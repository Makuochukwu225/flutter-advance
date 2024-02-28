// Other Screen
import 'package:theming/src/src.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Screen'),
      ),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: MyApp.themeNotifier,
            builder: (context, theme, _) {
              return PopupMenuButton<String>(
                onSelected: (value) => _onSelected(value),
                itemBuilder: (context) => _buildPopupItems(context),
                child: Builder(builder: (context) {
                  if (theme == ThemeMode.system) {
                    return const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("System"),
                        Icon(Icons.more_vert),
                      ],
                    );
                  }
                  if (theme == ThemeMode.dark) {
                    return const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dark"),
                        Icon(Icons.more_vert),
                      ],
                    );
                  }
                  return const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Light"),
                      Icon(Icons.more_vert),
                    ],
                  );
                }), // Or any other widget as the button
              );
            }),
      ),
    );
  }

  List<PopupMenuEntry<String>> _buildPopupItems(BuildContext context) {
    return [
      const PopupMenuItem(
        value: 'system',
        child: Text('System Theme'),
      ),
      const PopupMenuItem(
        value: 'light',
        child: Text('Light Theme'),
      ),
      const PopupMenuItem(
        value: 'dark',
        child: Text('Dark Theme'),
      ),
    ];
  }

  _onSelected(String value) {
    switch (value) {
      case "system":
        MyApp.themeNotifier.value = ThemeMode.system;
        ThemeService().setTheme(ThemeMode.system);
        break;
      case "light":
        MyApp.themeNotifier.value = ThemeMode.light;
        ThemeService().setTheme(ThemeMode.light);
        break;
      case "dark":
        MyApp.themeNotifier.value = ThemeMode.dark;
        ThemeService().setTheme(ThemeMode.dark);
        break;
      default:
    }
  }
}
