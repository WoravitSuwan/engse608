// ===============================
// Abstract Class: Car
// ===============================
abstract class Car {
  final String _id;        // รหัสรถ (แก้ไม่ได้)
  String model;            // รุ่นรถ
  double _price;           // ราคา
  int quantity;            // จำนวนคัน

  Car({
    required String id,
    required this.model,
    required double price,
    this.quantity = 0,
  })  : _id = id,
        _price = (price > 0) ? price : 0.0;

  // Getter
  String get id => _id;
  double get price => _price;

  // Setter ตรวจสอบราคา
  set price(double value) {
    if (value > 0) {
      _price = value;
    } else {
      print("❌ ราคาไม่ถูกต้อง");
    }
  }

  // ลดราคา
  void applyDiscount(double percent) {
    if (percent > 0 && percent <= 100) {
      _price -= _price * percent / 100;
    }
  }

  // เพิ่มจำนวนรถ
  void addStock(int amount) {
    if (amount > 0) {
      quantity += amount;
    }
  }

  void showInfo();
}

// ===============================
// Electric Car
// ===============================
class ElectricCar extends Car {
  int batteryCapacity; // kWh

  ElectricCar({
    required String id,
    required String model,
    required double price,
    required this.batteryCapacity,
  }) : super(id: id, model: model, price: price);

  @override
  void showInfo() {
    print("----------------");
    print("ID: $id");
    print("Model: $model");
    print("Price: $price");
    print("Type: Electric Car");
    print("Battery: $batteryCapacity kWh");
  }
}

// ===============================
// Fuel Car
// ===============================
class FuelCar extends Car {
  String fuelType; // Gasoline / Diesel

  FuelCar({
    required String id,
    required String model,
    required double price,
    required int quantity,
    required this.fuelType,
  }) : super(id: id, model: model, price: price, quantity: quantity);

  @override
  void showInfo() {
    print("----------------");
    print("ID: $id");
    print("Model: $model");
    print("Price: $price");
    print("Quantity: $quantity");
    print("Type: Fuel Car");
    print("Fuel: $fuelType");
  }
}

// ===============================
// General Car
// ===============================
class GeneralCar extends Car {
  GeneralCar({
    required String id,
    required String model,
    required double price,
    required int quantity,
  }) : super(id: id, model: model, price: price, quantity: quantity);

  @override
  void showInfo() {
    print("----------------");
    print("ID: $id");
    print("Model: $model");
    print("Price: $price");
    print("Quantity: $quantity");
    print("Type: General Car");
  }
}

// ===============================
// main
// ===============================
void main() {
  List<Car> showroom = [];

  var c1 = GeneralCar(
    id: "C001",
    model: "Toyota Corolla",
    price: 800000,
    quantity: 5,
  );
  c1.applyDiscount(5);
  showroom.add(c1);

  var c2 = ElectricCar(
    id: "E001",
    model: "Tesla Model 3",
    price: 1600000,
    batteryCapacity: 75,
  );
  showroom.add(c2);

  var c3 = FuelCar(
    id: "F001",
    model: "Ford Ranger",
    price: 1200000,
    quantity: 3,
    fuelType: "Diesel",
  );
  showroom.add(c3);

  // ทดสอบ setter
  c3.price = -100;

  // Polymorphism
  for (var car in showroom) {
    car.showInfo();
  }
}
