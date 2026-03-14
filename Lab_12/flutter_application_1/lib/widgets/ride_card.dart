import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/ride.dart';
import '../providers/ride_provider.dart';

class RideCard extends StatelessWidget {

  final Ride ride;

  const RideCard(this.ride, {super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0,4),
          )
        ],
      ),

      child: Row(
        children: [

          const Icon(
            Icons.directions_car,
            size: 36,
            color: Colors.green,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "${ride.from} → ${ride.to}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text("Time: ${ride.time}"),

                Text(
                  ride.seats == 0
                      ? "Full"
                      : "Seats: ${ride.seats}",
                  style: TextStyle(
                    color: ride.seats == 0
                        ? Colors.red
                        : Colors.black,
                  ),
                ),

                if (ride.bookedBy != null)
                  Text(
                    "Booked by: ${ride.bookedBy}",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              ElevatedButton(
                child: const Text("Book"),

                onPressed: ride.seats == 0
                    ? null
                    : () {

                        TextEditingController controller =
                            TextEditingController();

                        showDialog(
                          context: context,
                          builder: (_) {

                            return AlertDialog(
                              title: const Text("Enter your name"),

                              content: TextField(
                                controller: controller,
                                decoration: const InputDecoration(
                                  hintText: "Your name",
                                ),
                              ),

                              actions: [

                                TextButton(
                                  child: const Text("Cancel"),
                                  onPressed: () =>
                                      Navigator.pop(context),
                                ),

                                ElevatedButton(
                                  child: const Text("Confirm"),

                                  onPressed: () async {

                                    if(controller.text.isEmpty) return;

                                    await Provider.of<RideProvider>(
                                      context,
                                      listen: false,
                                    ).bookRide(
                                      ride,
                                      controller.text,
                                    );

                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
              ),

              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),

                onPressed: () {

                  Provider.of<RideProvider>(
                    context,
                    listen: false,
                  ).deleteRide(ride.id!);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}