import 'package:flutter/material.dart';
import 'package:front/colors/app_colors.dart';
import 'package:front/controllers/data_controller.dart';
import 'package:front/screens/view_task.dart';
import 'package:front/widgets/button_widget.dart';
import 'package:front/widgets/task_widget.dart';
import 'package:get/get.dart';

class ShowTasks extends StatefulWidget {
  const ShowTasks({super.key});

  @override
  State<ShowTasks> createState() => _ShowTasksState();
}

class _ShowTasksState extends State<ShowTasks> {
  _loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    _loadData();
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
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: AppColors.secondaryColor,
              ),
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
                  onPressed: () {
                    Get.back();
                  },
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
                  "${Get.find<DataController>().myData.length}",
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: GetBuilder<DataController>(
              builder: (controller) => ListView.builder(
                itemCount: controller.myData.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: leftEditIcon,
                    secondaryBackground: rightEditIcon,
                    onDismissed: (direction) {},
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.endToStart) {
                        return Future.delayed(
                          const Duration(seconds: 1),
                          () => true,
                        );
                      }
                      showModalBottomSheet(
                          barrierColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (_) {
                            return Container(
                              height: MediaQuery.of(context).size.height / 3,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                color: const Color(0xFF2e3253).withOpacity(0.5),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.off(() => ViewTask(
                                            id: controller
                                                .myData[index]["id"]));
                                      },
                                      child: ButtonWidget(
                                        color: AppColors.mainColor,
                                        text: "View",
                                        textColor: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ButtonWidget(
                                      color: AppColors.mainColor,
                                      text: "Edit",
                                      textColor: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                      return false;
                    },
                    key: ObjectKey(index),
                    child: TaskWidget(
                      task: controller.myData[index]["name"],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
