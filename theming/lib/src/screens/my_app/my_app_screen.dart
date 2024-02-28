import 'package:theming/src/src.dart';

class MyApp extends StatefulWidget {
   final ThemeMode themeMode;
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({Key? key, required this.themeMode}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  void _loadTheme()  {
    // ThemeMode themeMode = await ThemeService().getTheme();
    MyApp.themeNotifier.value = widget.themeMode;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MyApp.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            title: 'Kindacode.com',
            theme: ThemeData(primarySwatch: Colors.amber),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: const HomeScreen(),
          );
        });
  }
}
