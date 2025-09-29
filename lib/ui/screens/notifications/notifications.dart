import 'package:flutter/material.dart';
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  final List<_Notif> _dummy = const [
    _Notif(
      title: 'Your AI Health Report is Ready',
      subtitle:
      'Your latest health analysis shows low risk indicators. View full report for details.',
      time: '2 hours ago',
      icon: Icons.insert_drive_file,
      unread: true,
    ),
    _Notif(
      title: 'New Wellness Offer Available',
      subtitle:
      '20% off premium gym membership at FitLife Wellness Center. Limited time...',
      time: '4 hours ago',
      icon: Icons.card_giftcard,
      unread: true,
    ),
    _Notif(
      title: 'Appointment Confirmed',
      subtitle: 'Your consultation with Dr. Sarah Lee is confirmed for February 15, 2025 at 2:30PM.',
      time: '1 day ago',
      icon: Icons.calendar_today,
    ),
    _Notif(
      title: 'Medication Reminder',
      subtitle: 'Don\'t forget to take your evening medication. Tap to mark as taken.',
      time: '2 days ago',
      icon: Icons.notifications,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                  icon: const Icon(Icons.arrow_back_ios),
                ),

                const SizedBox(width: 6),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Notifications',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF3A2F7A),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          const SizedBox(width: 8),

                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6E3CF9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              '2 new',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Stay updated with your health journey',
                        style: TextStyle(
                          color: Color(0xFF9B98B0),
                          fontSize: 13,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),
                Flexible(
                  fit: FlexFit.loose,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.done_all_rounded, color: Color(0xFF6E3CF9)),
                      label: const Text(
                        'Mark All Read',
                        style: TextStyle(color: Color(0xFF6E3CF9)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8),
              for (final n in _dummy) ...[
                _NotifCard(notif: n),
                const SizedBox(height: 14),
              ],
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  const _NavIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon, color: const Color(0xFF9B98B0)),
    );
  }
}

class _NotifCard extends StatelessWidget {
  final _Notif notif;
  const _NotifCard({required this.notif});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // main card
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 6),
              )
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // icon box
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFEDE7FF), Color(0xFFF0E8FF)]),
                ),
                child: Icon(notif.icon, color: const Color(0xFF6E3CF9)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            notif.title,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF2B2550)),
                          ),
                        ),
                        if (notif.unread)
                          const SizedBox(width: 8)
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      notif.subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF8C86A3),
                        fontSize: 13,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      notif.time,
                      style: const TextStyle(
                        color: Color(0xFFBDB8CE),
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        // purple accent on left
        Positioned(
          left: -6,
          top: 10,
          bottom: 10,
          child: Container(
            width: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF6E3CF9), Color(0xFFB78CFF)],
              ),
            ),
          ),
        ),
        // small unread dot
        if (notif.unread)
          Positioned(
            right: 16,
            top: 12,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFF6E3CF9),
                shape: BoxShape.circle,
              ),
            ),
          )
      ],
    );
  }
}

class _Notif {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;
  final bool unread;

  const _Notif({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
    this.unread = false,
  });
}
