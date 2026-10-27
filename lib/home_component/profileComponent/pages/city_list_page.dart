import 'package:flutter/material.dart';
import 'package:vocal4local/component/appbar.dart';
import 'package:vocal4local/component/textfield.dart';

class CitySelectionPage extends StatefulWidget {
  const CitySelectionPage({super.key});

  @override
  State<CitySelectionPage> createState() => _CitySelectionPageState();
}

class _CitySelectionPageState extends State<CitySelectionPage> {
  final List<String> cities = [
    "Mumbai",
    "Pune",
    "Nagpur",
    "Nashik",
    "Thane",
    "Chhatrapati Sambhajinagar",
    "Solapur",
    "Kolhapur",
    "Amravati",
    "Sangli",
    "Jalgaon",
    "Akola",
    "Latur",
    "Ahmednagar",
    "Dhule",
    "Chandrapur",
    "Parbhani",
    "Nanded",
    "Ratnagiri",
    "Satara",
  ];

  String query = "";

  @override
  Widget build(BuildContext context) {
    final filteredCities = cities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      appBar: CustomAppBar(title: 'Select City'),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextfield(
              hintText: "Search city...",
              prefixIcon: const Icon(Icons.search),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCities.length,
                padding: EdgeInsets.only(left: 12, right: 12, top: 10),
                itemBuilder: (context, index) {
                  final city = filteredCities[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context, city);
                    },hoverColor: Colors.transparent,focusColor:Colors.transparent ,splashColor: Colors.transparent
                    ,highlightColor: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          city,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                        ),

                        Divider(
                          height: 40,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSecondary.withOpacity(0.4),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
