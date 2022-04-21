import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/fundraising_model.dart';
import 'progress_bar.dart';

class FundraisingScreen extends StatefulWidget {
  const FundraisingScreen({Key? key}) : super(key: key);

  @override
  State<FundraisingScreen> createState() => _FundraisingState();
}

class _FundraisingState extends State<FundraisingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FundraisingModel>(
      builder: (context, fundraising, child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProgressBar(value: fundraising.progress),
              ],
            ),
          ),
        );
      },
    );
  }
}
