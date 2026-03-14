import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ride_provider.dart';
import '../widgets/ride_card.dart';
import 'add_ride_screen.dart';
import 'booking_history_screen.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<RideProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Community Carpool"),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const BookingHistoryScreen(),
                ),
              );
            },
          )
        ],
      ),

      body: provider.rides.isEmpty
          ? const Center(child: Text("No rides available"))
          : ListView.builder(
              itemCount: provider.rides.length,
              itemBuilder: (context, index) {

                return RideCard(provider.rides[index]);
              },
            ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),

        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddRideScreen(),
            ),
          );
        },
      ),
    );
  }
}