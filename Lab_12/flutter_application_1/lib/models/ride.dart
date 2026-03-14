class Ride {

  final int? id;
  final String from;
  final String to;
  final String time;
  final int seats;
  final String? bookedBy;

  Ride({
    this.id,
    required this.from,
    required this.to,
    required this.time,
    required this.seats,
    this.bookedBy,
  });

  Map<String, dynamic> toMap() {

    return {
      'id': id,
      'fromLocation': from,
      'toLocation': to,
      'time': time,
      'seats': seats,
      'bookedBy': bookedBy,
    };
  }

  factory Ride.fromMap(Map<String, dynamic> map) {

    return Ride(
      id: map['id'],
      from: map['fromLocation'],
      to: map['toLocation'],
      time: map['time'],
      seats: map['seats'],
      bookedBy: map['bookedBy'],
    );
  }
}