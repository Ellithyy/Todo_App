import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_c9_sun_4pm/core/network_layer/firestore_utils.dart';
import 'package:todo_app_c9_sun_4pm/core/widgets/custom_text_form_field.dart';
import 'package:todo_app_c9_sun_4pm/model/task_model.dart';

class BottomSheetWidget extends StatefulWidget {
  BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add New Task",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge!.copyWith(color: Colors.black),
            ),
            CustomTextFormField(
              controller: titleController,
              hintText: "Enter Your Task Title",
              validator: (String? value) {
                if (value == null || value.trim().isEmpty) {
                  return "you must provide task title";
                } else if (value.length < 10) {
                  return "your task title must be at least 10 characters";
                } else {
                  return null;
                }
              },
              maxLines: 1,
            ),
            CustomTextFormField(
              controller: descriptionController,
              hintText: "Enter Your Task Description",
              maxLines: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Add New Task",
                  style:
                  theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    showCalender(context);
                  },
                  child: Text(
                    DateFormat.yMMMd().format(selectedDate),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: theme.primaryColor, fontSize: 18),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  var model = TaskModel(
                    title: titleController.text,
                    description: descriptionController.text,
                    dateTime: DateTime.now(),
                    isDone: false,
                  );

                  await FirestoreUtils.addDataToFirestore(model);
                  Navigator.pop(context);
                  print("Validation Title");
                }
              },
              child: Text(
                "Add Task",
                style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCalender(BuildContext context) async {
    var dateSelected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (dateSelected == null) return;
    selectedDate = dateSelected;
    setState(() {});
  }
}