import '../../../../core/exports_file/export.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          shadowColor: EColors.lime,
          child: ListTile(
            title: Text(task.title, style: style),
            subtitle: Text(task.description, style: style),
            trailing: CircleAvatar(
              backgroundColor: EColors.lime,
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: EColors.black,
                ),
                onPressed: onRemove,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(microseconds: 2200),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      TaskDetailsScreen(task: task),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      textDirection: TextDirection.ltr,
                      // opacity: animation,
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