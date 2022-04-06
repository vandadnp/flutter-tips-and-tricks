// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    Watches all changes to the TodoList object, then upon changes,
    extracts the itemsDescription proprety and only rebuilds the
    widget should the itemsDescription have actually changed!
    This is better for performance of your application!
    */
    final descriptionWithSelect = context.select<TodoList, String>(
      (todoList) => todoList.itemsDescription,
    );
    /*
    Marks the widget as needing to be rebuilt if *anything* changes
    in the TodoList object. Upon any change in the TodoList, it
    then extracts the itemsDescription and provides it to the
    widget to build.
    */
    final descriptionWithoutSelect = context.watch<TodoList>().itemsDescription;
    return Container();
  }
}
