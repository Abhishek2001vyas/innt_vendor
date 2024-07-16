import 'package:flutter/material.dart';

class Currency extends StatefulWidget {
  const Currency({super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Currency",
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: h / 20,
              width: w,
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    hintText: "Search in product list",
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(7))),
              ),
            ),
            SizedBox(
              height: h / 100,
            ),
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
