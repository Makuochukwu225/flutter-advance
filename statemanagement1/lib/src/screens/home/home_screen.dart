// This screen only displays un-completed tasks
import 'dart:developer';

import 'package:statemanagement1/src/src.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoProvider todoProvider =
        TodoProviderWidget.of(context).todoProvider;
    // using  singleton pattern
    // final TodoProvider todoProvider =
    //     TodoProvider();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Home'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<List<TodoModel>>(
        valueListenable: todoProvider.tasksNotifier,
        builder: (_, tasks, __) {
          log("$tasks");
          final uncompletedTasks =
              tasks.where((task) => task.isDone == false).toList();

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const ArchivePage(),
                      ));
                    },
                    child: const Text('View Completed Tasks')),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'You have ${uncompletedTasks.length} uncompleted tasks',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: uncompletedTasks.length,
                    itemBuilder: (_, index) => Card(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        elevation: 5,
                        color: Colors.amberAccent,
                        child: ListTile(
                          title: Text(uncompletedTasks[index].title!),
                          trailing: IconButton(
                            icon: const Icon(Icons.check_box_outline_blank),
                            onPressed: () {
                              todoProvider.finishTask(
                                  taskId: uncompletedTasks[index].id!);
                            },
                          ),
                        )),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoProvider.addNewTask(
              task: TodoModel.fromJson({
            "id": DateTime.now().toString(),
            "title": "Task ${DateTime.now()}",
            "isDone": false
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
