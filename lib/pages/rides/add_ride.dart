import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddRidePage extends StatefulWidget {
  const AddRidePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddRidePageState();
  }
}

class _AddRidePageState extends State<AddRidePage> {
  static final _dateFormat = DateFormat('EEEE, MMM d');
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _locationController = TextEditingController();
  final _milesController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final todayWeekday = now.weekday;
    final nextSunday = now.add(Duration(days: 7 - todayWeekday));

    return Scaffold(
      appBar: AppBar(title: const Text('Add Ride')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          TextField(
            controller: _dateController,
            decoration: const InputDecoration(
              labelText: 'Date',
              border: OutlineInputBorder(),
            ),
            readOnly: true,
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: nextSunday,
                firstDate: now,
                lastDate: now.add(const Duration(days: 60)),
              );

              _dateController.text =
                  date != null ? _dateFormat.format(date) : '';
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _timeController,
            decoration: const InputDecoration(
              labelText: 'Time',
              border: OutlineInputBorder(),
            ),
            readOnly: true,
            onTap: () async {
              final time = await showTimePicker(
                context: context,
                initialTime: const TimeOfDay(
                  hour: 8,
                  minute: 0,
                ),
              );

              _timeController.text = time?.format(context) ?? '';
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _locationController,
            decoration: const InputDecoration(
              labelText: 'Meeting Location',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _milesController,
            decoration: const InputDecoration(
              labelText: 'Miles',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
