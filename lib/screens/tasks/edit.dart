// Suggested code may be subject to a license. Learn more: ~LicenseLog:1913964993.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2653824609.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2435881210.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3959394761.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1269625954.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1516283892.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:722781301.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:851296903.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:928906845.
import 'package:flutter/material.dart';
import 'package:myapp/services/db.dart';

class EditTaskPage extends StatefulWidget {
  final String taskId;

  const EditTaskPage({super.key, required this.taskId});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    DbService().getTask(widget.taskId).then((task) {
      setState(() {
        _titleController.text = task?.title ?? "";
        _descriptionController.text = task?.description ?? "";
      });
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Update task data in database based on widget.taskId
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
