import 'package:flutter/material.dart';
import 'package:oscc_app/models/schedule/schedule_model.dart';
import 'package:provider/provider.dart';
import '../../models/schedule/ride.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScheduleState();
}

class _ScheduleState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleModel>(
      builder: (context, schedule, child) {
        return Scaffold(
          body: StreamBuilder<Iterable<Ride>>(
              stream: schedule.getAll().asStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final rides = snapshot.requireData.toList();

                return ListView.builder(
                  itemCount: rides.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: index == 0 ? Colors.lightBlue[100] : Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  rides[index].title!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(rides[index].location!),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(rides[index].date!),
                                Text("${rides[index].miles!} miles"),
                                Text(rides[index].difficulty!),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
        );
      },
    );
  }
}
