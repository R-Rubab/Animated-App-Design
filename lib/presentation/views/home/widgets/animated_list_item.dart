import 'package:flutter/material.dart';

import '../../../../data/models/model.dart';
import '../../details/details_view.dart';

class AnimatedListItem extends StatelessWidget {
  final Task task;
  final Animation<double> animation;
  final VoidCallback onRemove;

  const AnimatedListItem({
    super.key,
    required this.task,
    required this.animation,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          title: Text(task.title),
          subtitle: Text(task.description),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onRemove,
          ),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    TaskDetailsScreen(task: task),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          },
          // onTap: () {

          //   // Add selection highlight animation
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(
          //       content: Text('${task.title} selected'),
          //       duration: Duration(milliseconds: 500),
          //     ),
          //   );
          // },
        ),
      ),
    );
  }
}
// // Updated onTap Method
// onTap: () {
//   Navigator.push(
//     context,
//     PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) =>
//           TaskDetailsScreen(task: task),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(
//           opacity: animation,
//           child: child,
//         );
//       },
//     ),
//   );
// },