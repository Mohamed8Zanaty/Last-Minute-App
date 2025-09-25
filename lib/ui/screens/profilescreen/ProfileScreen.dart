import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            // ------- My Profile -------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Profile",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.create,
                  color: Colors.deepPurple,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              "Manage Your Health Information",
              style: TextStyle(
                color: Colors.deepPurple.shade300,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 5),

            // ------- Profile Card -------
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFB57BEF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        "SJ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Sara Johnasan",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "sarajohnsan@email.com",
                                style: TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              icon: Icon(
                                Icons.file_upload,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Member since January",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "2024",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // ------- Stats Section -------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _buildOfferItem(Icons.insert_drive_file, "12", "Total Records"),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildOfferItem(Icons.calendar_today, "8", "Appointments"),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildOfferItem(Icons.bar_chart, "5", "Ai Reports"),
                ),
              ],
            ),

            SizedBox(height: 20),

            // ------- Personal Info -------
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Personal Information",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Text(
                          "Phone",
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "+1 (555) 123-4567",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Text(
                          "Date of Birth",
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "March 15 , 1990",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Text(
                          "Blood Type",
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "O+",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Emergency Contact",
                            style: TextStyle(
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "John Iohnson - +1 (555) 987 6543",
                            textAlign: TextAlign.end,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // ------- Quick Access -------
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quick Access",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Icon(Icons.insert_drive_file, color: Colors.purple.shade700),
                        const SizedBox(width: 8),
                        Text(
                          "My Records",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "12 files",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.purple.shade700),
                        const SizedBox(width: 8),
                        Text(
                          "Appointments",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "Next - Feb 15",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Icon(Icons.bar_chart, color:Colors.purple.shade700),
                        const SizedBox(width: 8),
                        Text(
                          "AI Reports",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "5 Reports",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // ------- Sign Out Button -------
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    const SizedBox(width: 10),
                    Text(
                      "Sign out",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferItem(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.deepPurple, size: 34),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.deepPurple.shade800,
            ),
          ),
          SizedBox(height: 4),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
