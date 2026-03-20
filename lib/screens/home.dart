import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fundraising App"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Donate",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔴 HERO SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Help Someone in Need",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Start a fundraiser or donate to save lives.",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🟢 CATEGORIES
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Chip(label: Text("Medical")),
                Chip(label: Text("Education")),
                Chip(label: Text("Emergency")),
              ],
            ),

            const SizedBox(height: 20),

            // 🟡 TRENDING CAMPAIGNS
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Trending Campaigns",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // 📦 Campaign Card 1
            Card(
              margin: const EdgeInsets.all(16),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Help for Child Surgery",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text("Raised ₹25,000 of ₹50,000"),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(value: 0.5),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Donate"),
                    )
                  ],
                ),
              ),
            ),

            // 📦 Campaign Card 2
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Support Education",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text("Raised ₹10,000 of ₹30,000"),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(value: 0.3),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Donate"),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}