import '../../../core/exports_file/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Animated Task List',
          style: style.apply(fontSizeDelta: 3),
        ),
        centerTitle: true,
        backgroundColor: EColors.lime,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: Consumer<TaskViewModel>(
          builder: (context, viewModel, child) {
            return AnimatedList(
              key: viewModel.listKey,
              initialItemCount: viewModel.tasks.length,
              itemBuilder: (context, index, animation) {
                final task = viewModel.tasks[index];
                return AnimatedListItem(
                  task: task,
                  animation: animation,
                  onRemove: () => viewModel.removeTask(index),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: EColors.lime,
        elevation: 20,
        shape: const StadiumBorder(),
        onPressed: () {
          Provider.of<TaskViewModel>(context, listen: false).addTask(
            Task(title: 'New Task', description: 'Task description'),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
