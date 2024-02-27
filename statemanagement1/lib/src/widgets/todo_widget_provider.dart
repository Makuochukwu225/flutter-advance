import 'package:statemanagement1/src/src.dart';

class TodoProviderWidget extends InheritedWidget {
  final TodoProvider todoProvider;

  const TodoProviderWidget({
    required this.todoProvider,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  static TodoProviderWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TodoProviderWidget>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
