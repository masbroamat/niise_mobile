import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OCRScreen(),
    );
  }
}

class OCRScreen extends StatefulWidget {
  const OCRScreen({super.key});

  @override
  OCRScreenState createState() => OCRScreenState();
}

class OCRScreenState extends State<OCRScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController myKadController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController religionController = TextEditingController();

  String selectedGender = 'Male';
  List<String> genderOptions = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OCR Result", style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 128),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Personal Detail",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      buildTextField("Full Name", "Enter your full name", fullNameController),
                      buildDatePicker(context, "Date of Birth", "DD/MM/YYYY", dobController),
                      Row(
                        children: [
                          Expanded(child: buildDropdown("Gender", genderOptions)),
                          const SizedBox(width: 10),
                          Expanded(child: buildTextField("Nationality", "Enter nationality", nationalityController)),
                        ],
                      ),
                      buildTextField("MyKadNo", "Enter MyKad number", myKadController),
                      buildTextField("Address", "Enter your address", addressController),
                      buildTextField("Religion", "Enter religion", religionController),
                      const SizedBox(height: 20),
                      const Text(
                        "Photo",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildPhotoBox("Front"),
                          buildPhotoBox("Back"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                buildButton("CONTINUE", const Color.fromARGB(223, 5, 13, 87), Colors.white, () {}),
                const SizedBox(height: 10),
                buildButton("RETAKE", Colors.black, Colors.white, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, String placeholder, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: placeholder,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDatePicker(BuildContext context, String label, String placeholder, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              hintText: placeholder,
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      controller.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget buildDropdown(String label, List<String> options) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 5),
      DropdownButtonFormField<String>(
        value: selectedGender,
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: Colors.blue), // Sets text color to blue
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedGender = value!;
          });
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    ],
  );
}

  Widget buildPhotoBox(String label) {
    return Column(
      children: [
        Container(
          height: 110,
          width: 130,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

Widget buildButton(String text, Color bgColor, Color textColor, VoidCallback onPressed) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
