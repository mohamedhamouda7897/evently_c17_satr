import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17_str/core/firebase_functions.dart';
import 'package:evently_c17_str/models/task_model.dart';
import 'package:evently_c17_str/providers/home_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  DateFormat formatter = DateFormat("dd MMM");

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeTabProvider()..getStreamTasks(),
      builder: (context, child) {
        var provider = Provider.of<HomeTabProvider>(context);
        var categories = provider.categories;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
                        backgroundColor: provider.selectedCategoryIndex == index
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

              SizedBox(height: 12),
              Expanded(
                child: provider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : provider.errorMessage.isNotEmpty
                    ? Center(child: Text(provider.errorMessage))
                    : provider.tasks.isEmpty
                    ? Center(child: Text("No Tasks"))
                    : ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 193,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    "assets/images/${provider.tasks[index].category}.png",
                                    height: 193,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF0F0F0),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Text(
                                          formatter
                                              .format(
                                                DateTime.fromMillisecondsSinceEpoch(
                                                  provider.tasks[index].date,
                                                ),
                                              )
                                              .toString(),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF0F0F0),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(provider.tasks[index].title),
                                            GestureDetector(
                                              onTap: () {
                                                var task =
                                                    provider.tasks[index];
                                                task.isFavorite =
                                                    !task.isFavorite;
                                                FirebaseFunctions.updateTask(
                                                  provider.tasks[index],
                                                );
                                              },
                                              child: Icon(
                                                provider.tasks[index].isFavorite
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: provider.tasks.length,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
