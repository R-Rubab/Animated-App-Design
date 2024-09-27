import 'package:animations_user_experience_enhancements/data/models/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_models/view_models.dart';
import 'widgets/animated_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: Consumer<TaskViewModel>(
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
      floatingActionButton: FloatingActionButton(
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
