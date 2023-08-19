import 'package:flutter/material.dart';
import 'package:front/colors/app_colors.dart';
import 'package:front/widgets/task_widget.dart';

class ShowTasks extends StatelessWidget {
  const ShowTasks({super.key});

  @override
  Widget build(BuildContext context) {
    List tasks = [
      "Try Harder",
      "Try Smarter",
    ];
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(
        bottom: 8,
      ),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 150, 151, 149).withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
    final rightEditIcon = Container(
      margin: const EdgeInsets.only(
        bottom: 8,
      ),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              top: 40,
            ),
            alignment: Alignment.topLeft,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/header1.jpg"),
              ),
            ),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: AppColors.secondaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    size: 30,
                    color: AppColors.secondaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.calendar_month,
                  size: 27,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "${tasks.length}",
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: leftEditIcon,
                  secondaryBackground: rightEditIcon,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    return false;
                  },
                  key: ObjectKey(index),
                  child: TaskWidget(
                    task: tasks[index],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
