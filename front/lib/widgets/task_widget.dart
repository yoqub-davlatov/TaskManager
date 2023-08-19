import 'package:flutter/material.dart';
import 'package:front/colors/app_colors.dart';

class TaskWidget extends StatelessWidget {
  final String task;
  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 8,
      ),
      child: Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 14,
        decoration: BoxDecoration(
          color: AppColors.textHolder,
        ),
        child: Center(
          child: Text(
            task,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
