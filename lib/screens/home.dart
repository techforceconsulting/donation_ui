import 'package:flutter/material.dart';

class CharitismHome extends StatefulWidget {
  const CharitismHome({super.key});

  @override
  State<CharitismHome> createState() => _CharitismHomeState();
}

class _CharitismHomeState extends State<CharitismHome> {
  int currentIndex = 0;

  final List<Map<String, String>> slides = [
    {
      "title": "Celebrate your Birthday",
      "subtitle": "with the underprivileged kids.",
      "image":
          "https://images.unsplash.com/photo-1511895426328-dc8714191300"
    },
    {
      "title": "Feed Hungry Children",
      "subtitle": "Your small help can save lives.",
      "image":
          "https://images.unsplash.com/photo-1488521787991-ed7bbaae773c"
    },
    {
      "title": "Support Education",
      "subtitle": "Give children a brighter future.",
      "image":
          "https://images.unsplash.com/photo-1509062522246-3755977927d7"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _navbar(),
            _heroSlider(),
            _stats(),
            _searchSection(),
            _campaigns(),
            _footer(),
          ],
        ),
      ),
    );
  }

  // ================= NAVBAR =================
  Widget _navbar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE91E63), Color(0xFFFF6F91)],
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.favorite, color: Colors.white),
          const SizedBox(width: 8),
          const Text("Charitism",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          const Spacer(),
          _menu("Home"),
          _menu("Campaigns"),
          _menu("About"),
          _menu("Contact"),
          _menu("Login"),
          const SizedBox(width: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.pink,
            ),
            onPressed: () {},
            child: const Text("Donate"),
          )
        ],
      ),
    );
  }

  Widget _menu(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  // ================= HERO =================
  Widget _heroSlider() {
    return SizedBox(
      height: 450,
      child: Stack(
        children: [
          Image.network(
            slides[currentIndex]["image"]!,
            height: 450,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 450,
            color: Colors.black.withOpacity(0.5),
          ),
          Positioned(
            left: 80,
            top: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  slides[currentIndex]["title"]!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  slides[currentIndex]["subtitle"]!,
                  style: const TextStyle(
                      color: Colors.white70, fontSize: 22),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink),
                  onPressed: () {},
                  child: const Text("Donate Now"),
                )
              ],
            ),
          ),

          // LEFT
          Positioned(
            left: 20,
            top: 200,
            child: IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Colors.white, size: 30),
              onPressed: () {
                setState(() {
                  currentIndex =
                      (currentIndex - 1 + slides.length) % slides.length;
                });
              },
            ),
          ),

          // RIGHT
          Positioned(
            right: 20,
            top: 200,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward,
                  color: Colors.white, size: 30),
              onPressed: () {
                setState(() {
                  currentIndex =
                      (currentIndex + 1) % slides.length;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // ================= STATS =================
  Widget _stats() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _stat("5M+", "Lives Impacted"),
          _stat("₹10Cr+", "Donations"),
          _stat("50K+", "Donors"),
        ],
      ),
    );
  }

  Widget _stat(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey))
      ],
    );
  }

  // ================= SEARCH =================
  Widget _searchSection() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text("Explore Campaigns",
              style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Container(
            width: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade200, blurRadius: 10)
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Search campaigns...",
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: [
              _chip("All"),
              _chip("Hunger"),
              _chip("Education"),
              _chip("Medical"),
              _chip("Relief"),
              _chip("Animals"),
            ],
          )
        ],
      ),
    );
  }

  Widget _chip(String text) {
    return Chip(
      label: Text(text),
      backgroundColor: Colors.pink.shade50,
    );
  }

  // ================= CAMPAIGNS =================
  Widget _campaigns() {
    List data = [
      {
        "title": "Feed Hungry Children",
        "img": "https://images.unsplash.com/photo-1488521787991-ed7bbaae773c",
        "raised": 45000,
        "target": 100000,
        "donors": 120,
        "days": 5,
        "tag": "Tax Benefit"
      },
      {
        "title": "Education for Girls",
        "img": "https://images.unsplash.com/photo-1509062522246-3755977927d7",
        "raised": 30000,
        "target": 80000,
        "donors": 80,
        "days": 10,
        "tag": "Popular"
      },
      {
        "title": "Medical Help",
        "img": "https://images.unsplash.com/photo-1584515933487-779824d29309",
        "raised": 60000,
        "target": 120000,
        "donors": 100,
        "days": 7,
        "tag": "Urgent"
      }
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: data.map((e) {
          double progress = e["raised"] / e["target"];

          return Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(20)),
                        child: Image.network(
                          e["img"],
                          height: 170,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            e["tag"],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 10,
                        right: 10,
                        child: Icon(Icons.favorite_border,
                            color: Colors.white),
                      ),
                      const Positioned(
                        bottom: 10,
                        right: 10,
                        child: Icon(Icons.share, color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e["title"],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        LinearProgressIndicator(
                          value: progress,
                          color: Colors.green,
                          backgroundColor: Colors.grey.shade200,
                        ),
                        const SizedBox(height: 8),
                        Text(
                            "₹${e["raised"]} raised of ₹${e["target"]}",
                            style: const TextStyle(fontSize: 12)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("👥 ${e["donors"]}"),
                            Text("⏳ ${e["days"]} days"),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE91E63),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            child: const Text("DONATE NOW"),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // ================= FOOTER =================
  Widget _footer() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE91E63), Color(0xFFFF6F91)],
        ),
      ),
      child: Column(
        children: [
          const Text("Charitism",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text("Ensuring transparency in every donation",
              style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text("About", style: TextStyle(color: Colors.white)),
              Text("Contact", style: TextStyle(color: Colors.white)),
              Text("Privacy", style: TextStyle(color: Colors.white)),
              Text("Terms", style: TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 20),
          const Text("© 2026 Charitism",
              style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}