import 'package:flutter/material.dart';
import '../../../models/doctor.dart';

final List<DoctorModel> doctors = [
  DoctorModel(
    firstName: "Sarah",
    lastName: "Lee",
    specialty: "Cardiologist",
    rating: 4.9,
    yearsExperience: 12,
    availableDate: "Available Now",
    availableTime: "2:30 PM Today",
    price: "",
  ),
  DoctorModel(
    firstName: "Omar",
    lastName: "Hassan",
    specialty: "Dermatologist",
    rating: 4.8,
    yearsExperience: 8,
    availableDate: "Available Today",
    availableTime: "4:00 PM Today",
    price: "",
  ),
  DoctorModel(
    firstName: "Emily",
    lastName: "Chen",
    specialty: "General Physician",
    rating: 4.9,
    yearsExperience: 15,
    availableDate: "Available Now",
    availableTime: "3:15 PM Today",
    price: "",
  ),
  DoctorModel(
    firstName: "Michael",
    lastName: "Rodriguez",
    specialty: "Pediatrician",
    rating: 4.7,
    yearsExperience: 10,
    availableDate: "Available Tomorrow",
    availableTime: "9:00 AM Tomorrow",
    price: "",
  ),
];

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf8f7fc),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsetsDirectional.only(start: 22),
          child: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_back, size: 20, color: Color(0xFF3730a2)),
          ),
        ),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Consult a Doctor",
                  style: TextStyle(
                    color: Color(0xFF3730a2),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "Connect with specialists online",
                  style: TextStyle(color: Color(0xFF3730a2), fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.035,
            vertical: MediaQuery.sizeOf(context).height * 0.016,
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      color: Color(0XFF7e22cd),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Color(0xFF7e22cd)),
                      ),
                      child: Text(
                        "All Doctors",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Color(0xFF7e22cd)),
                      ),
                      child: Text(
                        "Available Now",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3730a2),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Color(0xFF7e22cd)),
                      ),
                      child: Text(
                        "Specialists",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3730a2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              ListView.separated(
                itemCount: doctors.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        MediaQuery.sizeOf(context).width * 0.0564,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(-4, 4),
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * 0.035,
                        vertical: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius:
                                        MediaQuery.sizeOf(context).width * 0.12,
                                    backgroundColor: Color(0xFFa78bfa),
                                    child: Text(
                                      'D${doctor.firstName[0]}${doctor.lastName[0]}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dr. ${doctor.firstName} ${doctor.lastName}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF3730a2),
                                        fontSize: 22,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          doctor.specialty,
                                          style: TextStyle(
                                            color: Color(0xFF3730a2),
                                            fontSize: 16,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          '\$ ${doctor.price} per session',
                                          style: TextStyle(
                                            color: Color(0xFF3730a2),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          color: Color(0xFF7e22cd),
                                        ),
                                        Text(
                                          doctor.rating.toString(),
                                          style: TextStyle(
                                            color: Color(0xFF3730a2),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Icon(
                                          Icons.access_time,
                                          color: Color(0xFF7e22cd),
                                          size: 20,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '${doctor.yearsExperience} years',
                                          style: TextStyle(
                                            color: Color(0xFF3730a2),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color:
                                      doctor.availableDate.toLowerCase() ==
                                          "available now"
                                      ? Color(0xFF7e22cd)
                                      : Color(0xFFc7d2ff),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  child: Text(
                                    doctor.availableDate,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          doctor.availableDate.toLowerCase() ==
                                              "available now"
                                          ? Colors.white
                                          : Color(0xFF3730a2),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.stop,
                                size: 10,
                                color: Colors.deepPurple[100],
                              ),
                              SizedBox(width: 3),
                              Text(
                                doctor.availableTime,
                                style: TextStyle(
                                  color: Color(0xFF3730a2),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xFF7e22cd),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.videocam_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(width: 7),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, '/chat');
                                        },
                                        child: Text(
                                          "Book Now",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
              ),

              SizedBox(height: 10),
              MaterialButton(
                onPressed: () {},
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Color(0xFF7e22cd)),
                ),
                child: Text(
                  "Load More Doctors",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3730a2),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
