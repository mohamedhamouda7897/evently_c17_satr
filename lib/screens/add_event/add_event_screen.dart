import 'package:evently_c17_str/core/firebase_functions.dart';
import 'package:evently_c17_str/models/task_model.dart';
import 'package:evently_c17_str/screens/home/tabs/home_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/add_event_provider.dart';

class AddEventScreen extends StatelessWidget {
  static const String routeName = "addEvent";

  // SELECT * FROM TABLE-NAME WHERE ()
  AddEventScreen({super.key});

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddEventProvider(),
      builder: (context, child) {
        var provider = Provider.of<AddEventProvider>(context);
        var categories = provider.categories;
        return Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset("assets/images/Back.png"),
            ),
            title: Text(
              "Add Event",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),

          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    "assets/images/${categories[provider.selectedCategoryIndex]}.png",
                  ),
                ),

                SizedBox(height: 18),
                SizedBox(
                  height: 45,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 12),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          provider.changeCategoryIndex(index);
                        },
                        child: Chip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          backgroundColor:
                              provider.selectedCategoryIndex == index
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                          label: Text(
                            categories[index]
                                .replaceAll("_", " ")
                                .toCapitalized(),
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(
                                  color: provider.selectedCategoryIndex == index
                                      ? Theme.of(context).colorScheme.onSurface
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                        ),
                      );
                    },
                    itemCount: categories.length,
                  ),
                ),
                SizedBox(height: 18),
                Text("Title"),
                SizedBox(height: 2),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    hintText: "Enter Title",
                  ),
                ),
                SizedBox(height: 24),
                Text("Description"),
                SizedBox(height: 2),
                TextField(
                  maxLines: 4,
                  controller: descriptionController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    hintText: "Enter Description",
                  ),
                ),

                SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/calendar-add.png"),
                    GestureDetector(
                      onTap: () {
                        selectDatePicker(context);
                      },
                      child: Text(
                        provider.selectedDate.toString().substring(0, 10),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      TaskModel task = TaskModel(
                        title: titleController.text,
                        userId: FirebaseAuth.instance.currentUser!.uid,
                        description: descriptionController.text,
                        date: provider.selectedDate.millisecondsSinceEpoch,
                        category:
                            provider.categories[provider.selectedCategoryIndex],
                      );

                      FirebaseFunctions.createTask(task);

                      Navigator.pop(context);
                    },
                    child: Text(
                      "Add Event",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  selectDatePicker(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(data: ThemeData(), child: child!);
      },
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (chosenDate != null) {
      Provider.of<AddEventProvider>(
        context,
        listen: false,
      ).changeDate(chosenDate);
    }
  }
}
