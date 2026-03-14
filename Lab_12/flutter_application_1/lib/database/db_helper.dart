import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/ride.dart';

class DBHelper {

  static Database? _db;

  static Future<Database> get database async {

    if (_db != null) return _db!;

    _db = await initDB();

    return _db!;
  }

  static Future<Database> initDB() async {

    final path = join(await getDatabasesPath(), 'carpool.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {

        await db.execute('''
        CREATE TABLE rides(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          fromLocation TEXT,
          toLocation TEXT,
          time TEXT,
          seats INTEGER,
          bookedBy TEXT
        )
        ''');
      },
    );
  }

  static Future insertRide(Ride ride) async {

    final db = await database;

    await db.insert(
      'rides',
      ride.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Ride>> getRides() async {

    final db = await database;

    final maps = await db.query('rides');

    return List.generate(maps.length, (i) {

      return Ride.fromMap(maps[i]);
    });
  }

  static Future deleteRide(int id) async {

    final db = await database;

    await db.delete(
      'rides',
      where: 'id=?',
      whereArgs: [id],
    );
  }

  // ⭐ ลดที่นั่งเมื่อจอง
static Future bookRide(Ride ride,String name) async {

  final db = await database;

  int newSeat = ride.seats - 1;

  await db.update(
    'rides',
    {
      'seats': newSeat,
      'bookedBy': name,
    },
    where: 'id=?',
    whereArgs: [ride.id],
  );
}
}