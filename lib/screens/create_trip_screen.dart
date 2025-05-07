import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_trip_task/core/appColor.dart';
import 'package:travel_trip_task/screens/dashboard_screen.dart';

class CreateTripScreen extends StatefulWidget {
  const CreateTripScreen({super.key});

  @override
  State<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreateTripScreen> {
  final TextEditingController fromController = TextEditingController(text: "");
  final TextEditingController toController = TextEditingController(text: "");
  final TextEditingController departureController = TextEditingController(text: "");
  final TextEditingController returnController = TextEditingController(text: "");
  final TextEditingController passengerController = TextEditingController(text: "");
  final TextEditingController classController = TextEditingController(text: "");

  List<Map<String, String>> passengers = [];

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    departureController.dispose();
    returnController.dispose();
    passengerController.dispose();
    classController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                color: AppColors.primaryColor,
              ),
              Positioned(
                top: 20,
                child: IconButton(
                  onPressed: () {
                    Get.to(() => DashboardScreen());
                  }, 
                  icon: Icon(Icons.arrow_back,color: AppColors.textPrimary,)
                )
              ),
              Positioned(
                bottom: 20,
                left: 16,
                child: Text(
                  "Let's Book Your\nNext Flight",
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Column(
                        children: [
                          _buildTextBox(
                              title: "From", controller: fromController),
                          const SizedBox(height: 12),
                          _buildTextBox(title: "To", controller: toController),
                        ],
                      ),
                      Positioned(
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.textPrimary,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.swap_vert,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //const SizedBox(height: 20),
                  // Column(
                  //   children: [
                  //     _buildTextBox(title: "Name", controller: toController),
                  //   ],
                  // ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTextBox(
                          title: "Date",
                          controller: departureController,
                          width: 160),
                      _buildTextBox(
                          title: "Return Date",
                          controller: returnController,
                          width: 160),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTextBox(
                          title: "Total Passengers",
                          controller: passengerController,
                          width: 160),
                      _buildTextBox(
                          title: "Class",
                          controller: classController,
                          width: 160),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showAddPassengerSheet(context);
                          // setState(() {
                          //   passengers.add({
                          //     'name': name,
                          //     'age': age,
                          //   });
                          // });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: AppColors.primaryColor,
                            ),
                            Text(
                              " Add Passenger",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     _buildTextBox(
                  //         title: "Passengers",
                  //         controller: passengerController,
                  //         width: 160),
                  //     _buildTextBox(
                  //         title: "Class",
                  //         controller: classController,
                  //         width: 160),
                  //   ],
                  // ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        final from = fromController.text;
                        final to = toController.text;
                        final departure = departureController.text;
                        final returning = returnController.text;
                        final passengers = passengerController.text;
                        //final travelClass = classController.text;

                        print('Booking from $from to $to');
                      },
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                            fontSize: 16, color: AppColors.textPrimary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextBox({
    required String title,
    required TextEditingController controller,
    double? width,
  }) {
    return Container(
      width: width ?? double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              color: AppColors.primaryColor,
              blurRadius: 4,
              offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Color.fromARGB(255, 102, 101, 101),
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  void _showAddPassengerSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        TextEditingController nameController = TextEditingController();
        TextEditingController ageController = TextEditingController();
        TextEditingController contactController = TextEditingController();
        TextEditingController nationalityController = TextEditingController();

        String gender = "Male";

        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Add New Passenger",style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  _buildTextBox(title: "Name", controller: nameController),
                  const SizedBox(height: 12),
                  _buildTextBox(title: "Age", controller: ageController),
                  const SizedBox(height: 12),
                  _buildTextBox(title: "Contact", controller: contactController),
                  const SizedBox(height: 12),
                  _buildTextBox(title: "Nationality", controller: nationalityController),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(" Gender",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              value: "Male",
                              groupValue: gender,
                              title: const Text("Male"),
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              value: "Female",
                              groupValue: gender,
                              title: const Text("Female"),
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        final name = nameController.text.trim();
                        final age = ageController.text.trim();

                        if (name.isNotEmpty && age.isNotEmpty) {
                          print("Passenger: $name, Age: $age, Gender: $gender");
                          Navigator.pop(context);
                        }
                      },
                      child:  Text("Save Passenger",
                          style: TextStyle(color: AppColors.textPrimary)),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
