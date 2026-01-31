import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c17_str/core/firebase_functions.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  FavoriteTab({super.key});

  DateFormat formatter = DateFormat("dd MMM");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFunctions.getFavoriteTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        if (snapshot.data!.docs.isEmpty) {
          return Center(child: Text("No Favorite Tasks"));
        }

        var tasks = snapshot.data!.docs.map((e) => e.data()).toList();
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              return Container(
                height: 193,
                width: double.infinity,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/${tasks[index].category}.png",
                        height: 193,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              formatter
                                  .format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                      tasks[index].date,
                                    ),
                                  )
                                  .toString(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(tasks[index].title),
                                GestureDetector(
                                  onTap: () {
                                    var task = tasks[index];
                                    task.isFavorite = !task.isFavorite;
                                    FirebaseFunctions.updateTask(tasks[index]);
                                  },
                                  child: Icon(
                                    tasks[index].isFavorite
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
            itemCount: tasks.length,
          ),
        );
      },
    );
  }
}
