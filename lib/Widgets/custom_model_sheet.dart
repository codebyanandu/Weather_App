import 'package:flutter/material.dart';

class SyncBottomSheet extends StatelessWidget {
  const SyncBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF1E2A78),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
  child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// TOP HANDLE
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 20),

          /// TITLE
          const Row(
            children: [
              Icon(Icons.sync, color: Colors.white),
              SizedBox(width: 10),
              Text(
                "Sync Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          /// ONLINE STATUS
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.green,
                ),
                SizedBox(width: 12),
                Text(
                  "Online",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Text(
                  "Last sync 10:45 AM",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 25),

          /// OPTIONS
          _tile(
            title: "Auto Sync",
            icon: Icons.cloud_sync,
            value: true,
          ),

          _tile(
            title: "WiFi Only",
            icon: Icons.wifi,
            value: false,
          ),

          _tile(
            title: "Offline Cache",
            icon: Icons.storage,
            value: true,
          ),

          const SizedBox(height: 25),

          /// SYNC BUTTON
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.sync),
              label: const Text("Sync Now"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF3A49F9),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// CLEAR CACHE
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            label: const Text(
              "Clear Cached Data",
              style: TextStyle(color: Colors.redAccent),
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),),
      
    );
  }

  Widget _tile({
    required String title,
    required IconData icon,
    required bool value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: (v) {},
          )
        ],
      ),
    );
  }
}