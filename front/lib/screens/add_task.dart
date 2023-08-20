import 'package:flutter/material.dart';
import 'package:front/colors/app_colors.dart';
import 'package:front/controllers/data_controller.dart';
import 'package:front/routes/routes.dart';
import 'package:front/widgets/button_widget.dart';
import 'package:front/widgets/error_widget.dart';
import 'package:front/widgets/text_field_widget.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    bool _dataValidation() {
      if (nameController.text.trim() == '') {
        Message.taskErrorOrWarning(
            "Task Name", "Your task name should not be empty!");
        return false;
      }
      if (detailController.text.trim() == '') {
        Message.taskErrorOrWarning(
            "Task Detail", "Your task detail should not be empty!");
        return false;
      }
      return true;
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        backgroundColor: AppColors.mainColor,
        child: const Icon(
          Icons.arrow_back,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 16, right: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/addtask1.jpg",
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                TextFieldWidget(
                  controller: nameController,
                  hintText: "Task Name",
                  radius: 30,
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  controller: detailController,
                  hintText: "Task Detail",
                  radius: 15,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (_dataValidation()) {
                      Get.find<DataController>().postData(
                        nameController.text,
                        detailController.text,
                      );
                      // Get.to(
                      //   () => const ShowTasks(),
                      //   transition: Transition.circularReveal,
                      // );
                      Get.offNamed(Routes.showTasks);
                    }
                  },
                  child: ButtonWidget(
                    color: AppColors.mainColor,
                    text: "Add",
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
