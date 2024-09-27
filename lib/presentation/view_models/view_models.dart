import '../../core/exports_file/export.dart';

class TaskViewModel extends ChangeNotifier {
  // Adding the list key to manage AnimatedList state
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.insert(0, task);
    listKey.currentState?.insertItem(0); // Insert animation at the top
    notifyListeners();
  }

  void removeTask(int index) {
    final removedTask = _tasks.removeAt(index);
    listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildRemovedItem(removedTask, animation),
    );
    notifyListeners();
  }

  // Custom function to build the removed item animation
  Widget _buildRemovedItem(Task task, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        elevation: 10,
        shadowColor: EColors.lime,
        child: ListTile(
          title: Text(
            task.title,
            style: style,
          ),
          subtitle: Text(task.description),
        ),
      ),
    );
  }
}
