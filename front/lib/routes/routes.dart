import 'package:front/screens/add_task.dart';
import 'package:front/screens/edit_task.dart';
import 'package:front/screens/home_screen.dart';
import 'package:front/screens/show_tasks.dart';
import 'package:front/screens/view_task.dart';
import 'package:get/get.dart';

class Routes {
  static const String home = "/";
  static const String showTasks = "/showTasks";
  static const String addTask = "/addTask";
  static const String editTask = "/editTask";
  static const String viewTask = "/viewTask";
  static String getHomeRoute() => home;
  static String getShowTasksRoute() => showTasks;
  static String getAddTaskRoute() => addTask;
  static String getEditTaskRoute(String id) => "$editTask/?id=$id";
  static String getViewTaskRoute(String id) => "$viewTask/?id=$id";
  static List<GetPage> routes = [
    GetPage(page: () => const HomeScreen(), name: home),
    GetPage(
      name: showTasks,
      page: () => const ShowTasks(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: addTask,
      page: () => const AddTask(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: editTask,
      page: () {
        var id = Get.parameters['id'];
        return EditTask(id: id!);
      },
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: viewTask,
      page: () {
        var id = Get.parameters['id'];
        return ViewTask(id: id!);
      },
      transition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
