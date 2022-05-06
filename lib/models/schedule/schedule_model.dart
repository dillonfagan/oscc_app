import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'ride.dart';

class ScheduleModel extends ChangeNotifier {
  Future<Iterable<Ride>> getAll() async {
    final response = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbzfZLZvP_mRFP9id1FOd-XG50k9IC4BcYfo0QYJgyTeucDfeA-OYk5XOqA_aKpgXVIk/exec"));

    if (response.statusCode != 200) throw "Unable to retrieve ride schedule.";
    Iterable<Ride> rides = Ride.decodeList(response.body);

    if (skipPastRides) {
      rides = rides.where((ride) => ride.date!.isAfter(DateTime.now()));
    }

    return rides;
  }

  static bool skipPastRides = true;
}
