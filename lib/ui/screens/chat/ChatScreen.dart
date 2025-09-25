import 'package:flutter/material.dart';

class Chatscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.deepPurple),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "SL",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Dr. Sarah Lee",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Cardiologist • Online",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call_outlined, color: Colors.deepPurple),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.video_call_outlined, color: Colors.deepPurple),
          ),
        ],
      ),
      body: _bodychat(),
    );
  }

  Widget _bodychat() {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: double.infinity,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          _itemchat(1, "Hello! I'm Dr. Sarah Lee. I've reviewed your recent health report. How are you feeling today?", "10:30 AM"),
          _itemchat(0, "Hi Doctor! I'm feeling better since starting the medication you prescribed. Thank you!", "10:32 AM"),
          _itemchat(1, "That's wonderful to hear! Are you experiencing any side effects from the medication?", "10:33 AM"),
          _itemchat(0, "No side effects so far. I have been taking it with food as you suggested.", "10:35 AM"),
          _itemchat(1, "Perfect! Continue with the current dosage. I'd like to schedule a follow-up appointment in 2 weeks to monitor your progress.", "10:36 AM"),
          _itemchat(0, "Sounds good! Should I book it through the app?", "10:40 AM"),
        ],
      ),
    );
  }

  Widget _itemchat(int chat, String message, String time) {
    bool isDoctor = chat == 1;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment:
        isDoctor ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (isDoctor) ...[
            Container(
              width: 28,
              height: 28,
              margin: const EdgeInsets.only(right: 6, bottom: 5),
              decoration: BoxDecoration(
                color: Color(0xFF9A9FF4),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Text(
                "SL",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isDoctor ? const Color(0xFF9A9FF4) : Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: isDoctor
                      ? const Radius.circular(0)
                      : const Radius.circular(20),
                  bottomRight: isDoctor
                      ? const Radius.circular(20)
                      : const Radius.circular(0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      time,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}