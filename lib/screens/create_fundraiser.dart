import 'package:flutter/material.dart';

class CreateFundraiserPage extends StatefulWidget {
  @override
  _CreateFundraiserPageState createState() => _CreateFundraiserPageState();
}

class _CreateFundraiserPageState extends State<CreateFundraiserPage> {
  final _formKey = GlobalKey<FormState>();

  String title = "";
  String description = "";
  String amount = "";
  String category = "Medical";

  final List<String> categories = [
    "Medical",
    "Education",
    "Emergency",
    "Animal",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Start Fundraiser",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              /// Card Container
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    /// Title
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Fundraiser Title",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) => title = value,
                      validator: (value) =>
                          value!.isEmpty ? "Enter title" : null,
                    ),

                    SizedBox(height: 15),

                    /// Description
                    TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: "Description",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) => description = value,
                      validator: (value) =>
                          value!.isEmpty ? "Enter description" : null,
                    ),

                    SizedBox(height: 15),

                    /// Amount
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Target Amount",
                        prefixText: "₹ ",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) => amount = value,
                      validator: (value) =>
                          value!.isEmpty ? "Enter amount" : null,
                    ),

                    SizedBox(height: 15),

                    /// Category Dropdown
                    DropdownButtonFormField<String>(
                      value: category,
                      items: categories.map((cat) {
                        return DropdownMenuItem<String>(
                          value: cat,
                          child: Text(cat),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          category = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Category",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    /// Image Upload
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload,
                              size: 40,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 8),
                            Text("Upload Cover Image"),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 25),

                    /// Gradient Button
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          submitForm();
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.purple],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Create Fundraiser",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitForm() {
    print("Title: $title");
    print("Description: $description");
    print("Amount: $amount");
    print("Category: $category");

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Fundraiser Created!")));
  }
}
