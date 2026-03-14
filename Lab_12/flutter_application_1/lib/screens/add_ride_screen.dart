import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/ride.dart';
import '../providers/ride_provider.dart';

class AddRideScreen extends StatefulWidget {

  const AddRideScreen({super.key});

  @override
  State<AddRideScreen> createState() => _AddRideScreenState();
}

class _AddRideScreenState extends State<AddRideScreen> {

  final fromController = TextEditingController();
  final toController = TextEditingController();
  final timeController = TextEditingController();
  final seatController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Add Ride")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: fromController,
              decoration: const InputDecoration(labelText: "From"),
            ),

            TextField(
              controller: toController,
              decoration: const InputDecoration(labelText: "To"),
            ),

            TextField(
              controller: timeController,
              decoration: const InputDecoration(labelText: "Time"),
            ),

            TextField(
              controller: seatController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Seats"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
  child: const Text("Save"),

  onPressed: () async {

    if(fromController.text.isEmpty ||
       toController.text.isEmpty ||
       timeController.text.isEmpty ||
       seatController.text.isEmpty){

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Fill all fields"))
      );

      return;
    }

    final ride = Ride(
      from: fromController.text,
      to: toController.text,
      time: timeController.text,
      seats: int.parse(seatController.text),
    );

    await Provider.of<RideProvider>(context,listen:false)
        .addRide(ride);

    Navigator.pop(context);
  },
)
          ],
        ),
      ),
    );
  }
}