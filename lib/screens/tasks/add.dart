// Suggested code may be subject to a license. Learn more: ~LicenseLog:1774814913.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1898749039.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:566284914.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:367307914.
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:myapp/components/form_input_field.dart';
import 'package:myapp/models/task.dart';
import 'package:myapp/services/db.dart';
import 'package:myapp/stores/tasks_store.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final DbService _dbService = DbService();

  final _formKey = GlobalKey<FormState>();
  TextEditingController titleC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();
  late final TasksStore _tasksStore;
  @override
  void initState() {
    _tasksStore = context.read<TasksStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                FormInputField(
                  label: "Título",
                  controller: titleC,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a task title';
                    }
                    return null;
                  },
                  hint: "Insira o título da tarefa",
                ),
                const Gap(
                  20,
                ),
                FormInputField(
                  label: "Descrição",
                  controller: descriptionC,
                  hint: "Insira o descrição da tarefa",
                ),
                const Gap(
                  20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _tasksStore.addTask(
                        Task(
                          id: DateTime.now().toString(),
                          title: titleC.text,
                          description: descriptionC.text,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Add Task'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
