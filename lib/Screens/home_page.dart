import 'package:flutter/material.dart';
import 'package:plant_app/const/colors.dart';
import 'package:plant_app/widgets/custom_app_bar.dart';
import 'package:plant_app/widgets/mango_tree_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // NEW: Image list for each plant status
  final List<String> plantImages = [
    'assets/img/seedling.png',
    'assets/img/sapling.png',
    'assets/img/tree.png',
    'assets/img/dead_plant.png',
  ];

  final List<String> statusLabels = [
    'Seedling',
    'Sapling',
    'Tree',
    'Dead Plant'
  ];

  int selectedStatusIndex = 0; // NEW: Track selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),

            // UPDATED: Dynamic Plant Image
            Center(
              child: Image.asset(
                plantImages[selectedStatusIndex],
                height: 150,
              ),
            ),

            const SizedBox(height: 20),

            // UPDATED: Status Chips with functionality
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(statusLabels.length, (index) {
                return ChoiceChip(
                  label: Text(statusLabels[index]),
                  selected: selectedStatusIndex == index,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedStatusIndex = index;
                    });
                  },
                );
              }),
            ),

            const SizedBox(height: 10),

            // Existing MangoTreeCard
            MangoTreeCard(),

            const SizedBox(height: 20),

            // Performance Section
            Text(
              'Performance',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircularProgressIndicator(
                    value: 0.54, color: Colors.green, strokeWidth: 6),
                CircularProgressIndicator(
                    value: 0.004, color: Colors.green, strokeWidth: 6),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
