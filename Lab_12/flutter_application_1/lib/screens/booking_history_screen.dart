import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ride_provider.dart';

class BookingHistoryScreen extends StatelessWidget {

  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<RideProvider>(context);

    final booked = provider.rides.where((r) => r.bookedBy != null).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Booking History")),

      body: booked.isEmpty
          ? const Center(child: Text("No bookings yet"))
          : ListView.builder(
              itemCount: booked.length,
              itemBuilder: (context, index) {

                final ride = booked[index];

                return ListTile(
                  title: Text("${ride.from} → ${ride.to}"),
                  subtitle: Text("Booked by ${ride.bookedBy}"),
                );
              },
            ),
    );
  }
}