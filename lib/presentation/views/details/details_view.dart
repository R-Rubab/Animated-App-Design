import '../../../core/exports_file/export.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: EColors.lime,
        title: Hero(
          tag: 'task-title-${task.title}',
          child: Material(
            color: Colors.transparent,
            child: Text(task.title, style: style),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'task-description-${task.title}',
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Text(task.description,
                        style: style.apply(
                          fontWeightDelta: 0,
                        )),
                    const Text(
                        "you'll focus on adding animations and improving the overall user experience of your Flutter app:: Implement basic animations such as fade-in, slide-in, or scale transitions for your list items.: Use the AnimatedList widget to animate the addition and removal of items in your list.: Enhance user interactions by adding visual feedback such as button press effects and item selection highlights.: Add smooth transitions between screens using the PageRouteBuilder or Hero animations for shared you'll focus on adding animations and improving the overall user experience of your Flutter app:: Implement basic animations such as fade-in, slide-in, or scale transitions for your list items.: Use the AnimatedList widget to animate the addition and removal of items in your list.: Enhance user interactions by adding visual feedback such as button press effects and item selection highlights.: Add smooth transitions between screens using the PageRouteBuilder or Hero animations for shared elements. AnimatedList widget to animate the addition and removal of items in your list.: Enhance user interactions by adding visual feedback such as button press effects and item selection highlights.: Add smooth transitions between screens using the PageRouteBuilder or Hero animations for shared elements."),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
