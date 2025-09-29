import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../settings/settings_screen.dart';
import '../wellness_offers/wellness_offers_screen.dart';
import '../chat/ChatScreen.dart';
import '../notifications/notifications.dart';
import '../profile/ProfileScreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
     const HomeContent(), 
     Chatscreen(),
     ProfileScreen(),
    const SettingsScreen(),
    const NotificationsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.deepPurple.withOpacity(0.5),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: "Notifications",
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {


    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/simage.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Sarah!",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "How can we help you feel better today?",
                              style: TextStyle(
                                color: Color(0xFF7E57C2),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Icon(Icons.notifications_outlined,
                              color: Colors.deepPurple),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            //  Search
            TextField(
              decoration: InputDecoration(
                hintText: "Search symptoms, doctors, or health",
                prefixIcon: Icon(Icons.search, color: Colors.deepPurple),
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            SizedBox(height: 24),

            //  AI Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF9d4edd),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.brain, color: Colors.white,
                          size: 20),
                      SizedBox(width: 8),
                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        child: Text("AI Powered",
                            style: TextStyle(
                                color: Colors.white, fontSize: 12)),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "AI Health Analysis",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Upload lab results or describe symptoms for AI analysis",
                          maxLines: 3,
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.19),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(FontAwesomeIcons.stethoscope,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed:
                        () {Navigator.pushNamed(context, '/ai_health_check');},
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF6f2dbd),
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Start Assessment",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            //  Consult Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF9A9FF4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.video_call_outlined,
                          color: Colors.deepPurple, size: 20),
                      SizedBox(width: 6),
                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.15),
                          border: Border.all(color: Colors.deepPurple),
                        ),
                        child: Text(
                          "Available now",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Consult a Doctor",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "Connect with specialist online",
                          style: TextStyle(
                              color: Colors.deepPurple.shade500, fontSize: 13),
                        ),
                      ),
                      Icon(Icons.calendar_today,
                          size: 18, color: Colors.deepPurple),
                    ],
                  ),
                  SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/chat');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Book now",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            //  Cards
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/medical_records');
                    },
                    child: _buildCard(
                      Icons.description_outlined,
                      "Medical Records",
                      "Emergency access",
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/find_clinics');
                    },
                    child: _buildCard(
                      Icons.location_on_outlined,
                      "Find Clinics",
                      "Nearby Hospitals",
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            //  Wellness Offers
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Icon(Icons.favorite_border_outlined,
                          color: Colors.deepPurple),
                      SizedBox(width: 8),
                      Text(
                        "Wellness Offers",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/wellness_offers');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepPurple.shade200,
                          minimumSize: Size(40, 30),
                          padding: EdgeInsets.symmetric(horizontal: 8),
                        ),
                        child: Text("New",
                            style: TextStyle(
                                color: Colors.white, fontSize: 12)),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.auto_awesome_outlined,
                          color: Colors.deepPurple),
                    ],
                  ),
                  SizedBox(height: 16),


                  Center(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        _buildOfferItem(Icons.fitness_center_outlined,
                            "Gym Membership", "Up to 30% off", size: 110),
                        _buildOfferItem(Icons.auto_awesome_outlined,
                            "Skincare", "Premium brands", size: 110),
                        _buildOfferItem(Icons.favorite_border_outlined,
                            "Organic Foods", "Fresh delivery", size: 110),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF6f2dbd),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Explore All Offers",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }

  Widget _buildCard(IconData icon, String title, String subtitle) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Color(0xFF9A9FF4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.deepPurple, size: 22),
          ),
          SizedBox(height: 6),
          Text(title,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple)),
          Text(subtitle,
              style: TextStyle(
                  fontSize: 12, color: Colors.deepPurple.shade400)),
        ],
      ),
    );
  }

  Widget _buildOfferItem(IconData icon, String title, String subtitle,
      {double size = 110}) {
    return Container(
      width: size,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
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
              color: Colors.black,
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