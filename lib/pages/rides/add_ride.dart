import 'package:flutter/material.dart';

class AddRidePage extends StatefulWidget {
  const AddRidePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddRidePageState();
  }
}

class _AddRidePageState extends State<AddRidePage> {
  final _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Ride')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          TextField(
            controller: _dateController,
            decoration: const InputDecoration(labelText: 'Date'),
            readOnly: true,
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 60)),
              );

              _dateController.text = date.toString().substring(0, 10);
            },
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
