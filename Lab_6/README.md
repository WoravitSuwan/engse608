📘 Lab_06
การศึกษาและพัฒนาแอปพลิเคชันด้วย Material Components และ Navigation ใน Flutter
1️⃣ วัตถุประสงค์ของโปรแกรม

Lab_06 นี้มีวัตถุประสงค์เพื่อ:

ศึกษา Material Component Widgets ของ Flutter

ทดลองใช้งาน Navigation และ Routing

สร้างแอปที่แยกการแสดงผลเป็นหมวดหมู่

แสดงตัวอย่างการใช้งาน Widget พร้อมผลลัพธ์จริง

2️⃣ โครงสร้างโปรแกรม
lib/
 ├── main.dart
 ├── home_page.dart
 └── pages/
      ├── actions_page.dart
      ├── communication_page.dart
      ├── containment_page.dart
      ├── navigation_page.dart
      ├── selection_page.dart
      └── textinput_page.dart


แนวคิดที่ใช้:

แยกไฟล์ตามหน้าจอ (Page-based architecture)

ใช้ Named Routes สำหรับ Navigation

3️⃣ การทำงานของ main.dart

ไฟล์ main.dart เป็นจุดเริ่มต้นของโปรแกรม

void main() {
  runApp(const MyApp());
}


MyApp ทำหน้าที่:

กำหนด Theme

กำหนด routes

ตั้งค่า initialRoute

ตัวอย่าง:

routes: {
  '/': (context) => const HomePage(),
  '/actions': (context) => const ActionsPage(),
  '/communication': (context) => const CommunicationPage(),
}


อธิบาย:

ใช้ Named Route

เมื่อเรียก Navigator.pushNamed() จะเปลี่ยนหน้าอัตโนมัติ

4️⃣ หน้า HomePage

หน้าหลักแสดงเมนูเลือกหมวดหมู่

ใช้ Widget:

Scaffold

AppBar

ListView

Card

ListTile

Icon

ตัวอย่างการนำทาง:

Navigator.pushNamed(context, "/actions");


อธิบาย:

เมื่อผู้ใช้กดเมนู

ระบบจะเรียก route ที่กำหนดไว้ใน main.dart

5️⃣ การอธิบายแต่ละหมวด
🔹 5.1 Actions Widgets

อยู่ในไฟล์: actions_page.dart

ตัวอย่างที่ใช้:

ElevatedButton

OutlinedButton

TextButton

IconButton

ตัวอย่างโค้ด:

ElevatedButton(
  onPressed: () {},
  child: Text("Save"),
)


อธิบาย:

onPressed คือ event handler

ใช้สำหรับ trigger action ต่าง ๆ

🔹 5.2 Communication Widgets

อยู่ใน communication_page.dart

ตัวอย่าง:

SnackBar

AlertDialog

ตัวอย่าง:

ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text("Saved"))
);


อธิบาย:

SnackBar ใช้แจ้งเตือนชั่วคราว

Dialog ใช้ยืนยันการกระทำ

🔹 5.3 Containment Widgets

อยู่ใน containment_page.dart

ตัวอย่าง:

Card

ExpansionTile

Container

อธิบาย:

ใช้สำหรับจัดกลุ่มเนื้อหาให้เป็นระเบียบตามหลัก Material Design

🔹 5.4 Navigation Widgets

อยู่ใน navigation_page.dart

ตัวอย่าง:

NavigationBar (Material 3)

BottomNavigationBar

NavigationBar(
  selectedIndex: index,
  onDestinationSelected: (i) {
    setState(() => index = i);
  },
)


อธิบาย:

ใช้สำหรับเปลี่ยนหน้าภายในแอป

รองรับ multi-page layout

🔹 5.5 Selection Widgets

อยู่ใน selection_page.dart

ตัวอย่าง:

Checkbox

Radio

Switch

Switch(
  value: isOn,
  onChanged: (val) {
    setState(() => isOn = val);
  },
)


อธิบาย:

ใช้เลือกค่าแบบ Boolean หรือ ตัวเลือกเดียว

🔹 5.6 Text Input Widgets

อยู่ใน textinput_page.dart

ตัวอย่าง:

TextField

TextFormField

Form + Validation

TextFormField(
  validator: (value) {
    if (value == null || value.isEmpty) {
      return "กรุณากรอกข้อมูล";
    }
    return null;
  },
)


อธิบาย:

ใช้รับข้อมูลจากผู้ใช้

มีระบบ validation

6️⃣ การใช้งาน Navigation และ Routing

ใน Lab นี้ใช้ 2 รูปแบบ:

1. Using Navigator
Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => SecondPage()),
);

2. Using Named Routes
Navigator.pushNamed(context, '/actions');


ข้อดีของ Named Routes:

โครงสร้างชัดเจน

จัดการง่ายเมื่อแอปใหญ่ขึ้น

7️⃣ หลักการออกแบบที่ใช้

Material Design

Separation of UI Components

Reusable Widgets

State Management ด้วย setState

Modular File Structure

<img width="505" height="1008" alt="Screenshot 2569-02-12 at 16 31 02" src="https://github.com/user-attachments/assets/0ec8f9ca-4a22-4680-9050-28ffe0babae2" />

