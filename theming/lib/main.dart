// main.dart
import 'package:theming/src/src.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   ThemeMode themeMode = await ThemeService().getTheme();
  runApp(MyApp(themeMode: themeMode));
}
