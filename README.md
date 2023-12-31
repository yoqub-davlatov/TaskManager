# Streamlined Task Management App

## Project Description: 

Introducing a cutting-edge task management application designed to 
empower users in efficiently organizing their daily activities, projects, and to-do lists. 
With a sleek and intuitive user interface developed using Flutter for the front-end and 
Go for the server, the application offers a seamless experience for task creation, viewing, editing, and deletion.

## Demo:

https://github.com/yoqub-davlatov/TaskManager/assets/111530950/ad64e106-e6b2-4a32-9b0e-6be49937f646
                                                                
## Key Features:

1. **Task Creation:** The app allows users to effortlessly create new tasks, enabling them to capture their ideas and responsibilities as they arise. The app offers an intuitive task entry form with fields for task title, description, due date, priority, and any additional notes.

2. **Task List View:** The app provides users with an organized and visually appealing list view of all their tasks. Tasks are conveniently sorted by due date and priority, aiding users in quickly identifying and focusing on the most pressing tasks.

3. **Effortless Editing:** It simplifies task management by allowing users to easily edit task details. Users can modify task titles, descriptions, due dates, priorities, and notes, ensuring their task list remains up-to-date and reflective of changing priorities.

4. **Streamlined Deletion:** Unnecessary tasks cluttering the user's to-do list can be deleted with just a few taps. Application ensures that users can swiftly remove tasks that are no longer relevant, contributing to a cleaner and more organized task list.

5. **User-Friendly Interface:** The user interface of the application is designed for maximum ease of use. With an elegant design and intuitive navigation, users can quickly learn how to utilize the app's features, enhancing their overall experience.

6. **Secure Data Handling:** Application prioritizes data security and privacy. All user-generated data, including tasks and user information, is securely stored and transmitted through a robust server developed using Go-lang, minimizing the risk of unauthorized access.

## Technology Stack:

- *Front-End:* Flutter - A versatile framework for building natively compiled applications for mobile, web, and desktop from a single codebase.
- *Back-End:* Go - A powerful programming language known for its efficiency and performance, well-suited for building robust server-side applications.
  
## Project Installation:

To install the application from the repository, follow these steps:

1. *Clone the Git repository:*

  Open your terminal or command prompt and navigate to the directory where you want to clone the repository. Then, run the following command:
```bash
https://github.com/yoqub-davlatov/TaskManager.git
```
2. *Navigate to the project directory:*

   After cloning the repository, navigate to the project's root directory using the terminal or command prompt:
```bash
cd REPOSITORY_PATH
```

3. *Run the server:*

   Before you start the app make sure the server is running. For that make sure Golang is set up on your device. Then go to ```back\src``` folder, and run ```main.go```.
   
4. *Connect a device:*

  Connect your Android device to your computer or set up an emulator to run the Flutter application. If you are using your device make sure to run the following code on your terminal:
  
  ```bash
  adb reverse tcp:8000 tcp:8000
  ```
  
7. *Run the application:*

   To run the Flutter application on a connected device or emulator, go to ```front``` folder and use the `flutter run` command:
   
```bash
flutter run
```
The application will be compiled and launched on your device or emulator.

8. *Use the application:*

  Well done! Enjoy using the app with its user-friendly interface!

## Future Enhancements:

The application is not just a task management app; it's a platform that can evolve and expand based on user needs. Future enhancements could include:

- User Accounts: Implementing user authentication and account management features to provide users with personalized task lists and data synchronization across devices.
- Task Categories and Labels: Enabling users to categorize tasks with labels or tags, making it even easier to filter and sort tasks based on specific contexts or projects.
- Reminders and Notifications: Introducing task reminders and notifications to ensure that users never miss important deadlines or tasks.
- Collaboration: Allowing users to share tasks or collaborate on projects by inviting others to view or contribute to specific tasks.
- Data Insights: Incorporating data visualization and insights, helping users understand their task completion patterns and productivity trends.
- Responsive Design: Adapting the application to various screen sizes and orientations, ensuring a consistent experience across different devices.
