import 'package:go_router/go_router.dart';
import 'package:myapp/screens/tasks/add.dart';
import 'package:myapp/screens/tasks/list.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const TaskListScreen(),
        routes: [
          GoRoute(
            path: 'add',
            builder: (context, state) => const AddTaskScreen(),
          ),
        ]),
  ],
);
