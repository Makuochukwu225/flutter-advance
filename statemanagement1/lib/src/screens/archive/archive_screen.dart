// This screen only display completed tasks
import 'package:statemanagement1/src/src.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoProvider _todoProvider =
        TodoProviderWidget.of(context).todoProvider;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ValueListenableBuilder<List<TodoModel>>(
          valueListenable: _todoProvider.tasksNotifier,
          builder: (_, tasks, __) {
            final completedTasks =
                tasks.where((task) => task.isDone == true).toList();
            return ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (_, index) => Card(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  elevation: 5,
                  color: Colors.pinkAccent,
                  child: ListTile(
                    title: Text(completedTasks[index].title!),
                    trailing: IconButton(
                      icon: const Icon(Icons.check_box),
                      onPressed: () => _todoProvider.uncheckTask(
                          taskId: completedTasks[index].id!),
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}
