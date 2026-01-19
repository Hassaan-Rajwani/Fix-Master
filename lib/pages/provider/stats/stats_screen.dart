import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      appBar: AppBar(
        title: const Text("Performance"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _performanceScoreCard(),
            const SizedBox(height: 16),
            _statsGrid(),
            const SizedBox(height: 24),
            const Text(
              "Recent Reviews",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _reviewTile(
              "Emily C.",
              "Excellent service! Very professional and quick.",
              2,
            ),
            _reviewTile(
              "David P.",
              "Great job on the AC. Works perfectly now.",
              3,
            ),
            _reviewTile("Lisa W.", "Good service, arrived on time.", 5),
            const SizedBox(height: 16),
            _successMessage(),
          ],
        ),
      ),
    );
  }

  Widget _performanceScoreCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xff4C8BF5), Color(0xff3B6EEA)],
        ),
      ),
      child: Column(
        children: const [
          Icon(Icons.workspace_premium, color: Colors.white, size: 36),
          SizedBox(height: 8),
          Text("Performance Score", style: TextStyle(color: Colors.white70)),
          SizedBox(height: 8),
          Text(
            "96",
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text("+3 from last month", style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _statsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        _StatCard("4.9", "Rating", Icons.star, Colors.orange),
        _StatCard(
          "94%",
          "Acceptance\nLast 30 days",
          Icons.thumb_up,
          Colors.green,
        ),
        _StatCard("98%", "On-Time\nPunctuality", Icons.schedule, Colors.blue),
        _StatCard(
          "99%",
          "Completion\nJob success",
          Icons.check_circle,
          Colors.teal,
        ),
      ],
    );
  }

  Widget _reviewTile(String name, String review, int daysAgo) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: Text(name[0]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(review),
                const SizedBox(height: 4),
                Text(
                  "$daysAgo days ago",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _successMessage() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffE6F4EA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.emoji_events, color: Colors.green),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Great Job!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "You're in the top 5% of providers this month.\nKeep up the excellent work!",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color color;

  const _StatCard(this.value, this.label, this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
