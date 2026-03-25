import 'package:flutter/material.dart';

class FundRaiser extends StatefulWidget {
  const FundRaiser({super.key});

  @override
  State<FundRaiser> createState() => _FundRaiserState();
}

class _FundRaiserState extends State<FundRaiser> {
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

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _navbar(context),
            _heroSlider(context),
            _stats(context),
            _searchSection(context),
            _campaigns(context),
            _footer(context),
          ],
        ),
      ),
    );
  }

  // ================= NAVBAR =================
  Widget _navbar(BuildContext context) {
    bool mobile = isMobile(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE91E63), Color(0xFFFF6F91)],
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.favorite, color: Colors.white),
          const SizedBox(width: 8),
          const Text("Donation",
              style: TextStyle(color: Colors.white, fontSize: 22)),
          const Spacer(),
          if (mobile)
            PopupMenuButton<String>(
              icon: const Icon(Icons.menu, color: Colors.white),
              onSelected: (value) {
                if (value == "Login") {
                  Navigator.pushNamed(context, '/login');
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: "Home", child: Text("Home")),
                const PopupMenuItem(value: "Campaigns", child: Text("Campaigns")),
                const PopupMenuItem(value: "About", child: Text("About")),
                const PopupMenuItem(value: "Contact", child: Text("Contact")),
                const PopupMenuItem(value: "Login", child: Text("Login")),
                const PopupMenuDivider(),
              ],

            )

          else ...[
            _menu("Home", context),
            _menu("Campaigns", context),
            _menu("About", context),
            _menu("Contact", context),
            _menu("Login", context),
            const SizedBox(width: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.pink,
              ),
              onPressed: () {},
              child: const Text("Donate"),
            )
          ]
        ],
      ),
    );
  }

  Widget _menu(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  // ================= HERO =================
  Widget _heroSlider(BuildContext context) {
    bool mobile = isMobile(context);

    return SizedBox(
      height: mobile ? 300 : 450,
      child: Stack(
        children: [
          Image.network(
            slides[currentIndex]["image"]!,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withValues(alpha: 0.5)),

          Positioned(
            left: 20,
            right: 20,
            top: mobile ? 80 : 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  slides[currentIndex]["title"]!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: mobile ? 22 : 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  slides[currentIndex]["subtitle"]!,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: mobile ? 14 : 22,
                  ),
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
  Widget _stats(BuildContext context){

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _stat("5M+", "Lives Impacted"),
            _stat("₹10Cr+", "Donations"),
            _stat("50K+", "Donors"),
          ],
        ),
      ),
    );
  }

  Widget _stat(String value, String label) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(value,
              style:
              const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(color: Colors.grey))
        ],
      ),
    );
  }

  // ================= SEARCH =================
  Widget _searchSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("Explore Campaigns",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
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
  Widget _campaigns(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    int crossAxisCount = width < 600
        ? 1
        : width < 1000
        ? 2
        : 3;

    List data = [
      {
        "title": "Feed Hungry Children",
        "img": "https://images.unsplash.com/photo-1488521787991-ed7bbaae773c",
        "raised": 45000,
        "target": 100000,
      },
      {
        "title": "Education for Girls",
        "img": "https://images.unsplash.com/photo-1509062522246-3755977927d7",
        "raised": 30000,
        "target": 80000,
      },
      {
        "title": "Medical Help",
        "img": "https://images.unsplash.com/photo-1584515933487-779824d29309",
        "raised": 60000,
        "target": 120000,
      }
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          var e = data[index];
          double progress = e["raised"] / e["target"];

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Image.network(e["img"], height: 150, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(e["title"]),
                      LinearProgressIndicator(value: progress),
                      Text("₹${e["raised"]} / ₹${e["target"]}")
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  // ================= FOOTER =================
  Widget _footer(BuildContext context) {
    bool mobile = isMobile(context);

    return Container(
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE91E63), Color(0xFFFF6F91)],
        ),
      ),
      child: Column(
        children: [
          const Text("Charitism",
              style: TextStyle(color: Colors.white, fontSize: 22)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 20,
            alignment: WrapAlignment.center,
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