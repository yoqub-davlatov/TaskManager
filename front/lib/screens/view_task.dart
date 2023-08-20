import 'package:flutter/material.dart';
import 'package:front/colors/app_colors.dart';
import 'package:front/controllers/data_controller.dart';
import 'package:front/widgets/text_field_widget.dart';
import 'package:get/get.dart';

class ViewTask extends StatelessWidget {
  final String id;
  const ViewTask({super.key, required this.id});
  _loadTask() async {
    await Get.find<DataController>().getTask(id);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    _loadTask();
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
      body: GetBuilder<DataController>(
        builder: (controller) => Container(
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
                    hintText: controller.singleData["name"].toString(),
                    radius: 30,
                    readOnly: true,
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    readOnly: true,
                    controller: detailController,
                    hintText: controller.singleData["detail"].toString(),
                    radius: 15,
                    maxLines: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  
  }
}
