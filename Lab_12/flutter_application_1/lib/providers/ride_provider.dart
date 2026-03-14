import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../models/ride.dart';

class RideProvider extends ChangeNotifier {

  List<Ride> rides = [];

  RideProvider(){
    loadRides();
  }

  Future loadRides() async {

    rides = await DBHelper.getRides();

    notifyListeners();
  }

  Future addRide(Ride ride) async {

    await DBHelper.insertRide(ride);

    await loadRides();
  }

  Future deleteRide(int id) async {

    await DBHelper.deleteRide(id);

    await loadRides();
  }

  Future bookRide(Ride ride,String name) async {

    if(ride.seats <= 0) return;

    await DBHelper.bookRide(ride,name);

    await loadRides();
  }
}