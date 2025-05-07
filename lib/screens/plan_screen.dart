import 'package:flutter/material.dart';
import 'package:travel_trip_task/core/app_color.dart';
import 'package:dotted_line/dotted_line.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Trip Plan",
            style: TextStyle(
                color: AppColors.textPrimary, fontWeight: FontWeight.bold),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: AppColors.primaryColor),
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, color: AppColors.textPrimary),
            ),
          ],
        ),
        body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.textPrimary,
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.primaryColor,
                      blurRadius: 4,
                      offset: Offset(2, 2)),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.flight_takeoff_outlined),
                            SizedBox(width: 5,),
                            Text(
                              "Surat",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: DottedLine(
                                  dashLength: 6,
                                  dashColor: AppColors.dottedline,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: AppColors.dottedline,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        Row(
                          children: [
                            Icon(Icons.flight_land_outlined),
                            SizedBox(width: 5,),
                            Text(
                              "Ahmedabad",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "07 May 2025",
                          style: TextStyle(color: AppColors.textdescrip),
                        ),
                        Text(
                          "11 May 2025",
                          style: TextStyle(color: AppColors.textdescrip),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "11:00 AM",
                          style: TextStyle(color: AppColors.textdescrip),
                        ),
                        Text(
                          "9:00 PM",
                          style: TextStyle(color: AppColors.textdescrip),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text("Created",style: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold),)
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
        ));
  }
}
