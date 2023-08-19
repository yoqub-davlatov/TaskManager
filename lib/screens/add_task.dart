import 'package:flutter/material.dart';
import 'package:front/colors/app_colors.dart';
import 'package:front/widgets/button_widget.dart';
import 'package:front/widgets/text_field_widget.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                ButtonWidget(
                  color: AppColors.mainColor,
                  text: "Add",
                  textColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
