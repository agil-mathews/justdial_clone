import 'package:flutter/material.dart';
import 'package:test_project/common/chip.dart';

class CategoryPagee extends StatefulWidget {
  @override
  State<CategoryPagee> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPagee> {
  Set<int> expandedTiles = Set(); // Track expanded tiles by index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0,vertical: 5.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search categories',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
           const Divider(
            height: 1, // Set height to 1 to minimize space taken by Divider
            thickness: 0.1, // Set thickness to ensure the line is visible
          ),

          // Horizontal list of categories
          Container(
            
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
        color: Colors.black.withOpacity(0.1), // Shadow color with opacity
        spreadRadius: 1, // Spread radius
        blurRadius: 25, // Blur radius
        offset: const Offset(5, 8), // Offset from the widget
      ),
              ]
            ),
            // color: Colors.blue,
            height: 50.0, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10.0),
                  child: Text(categories[index],style: const TextStyle(fontSize: 20),),
                );
              },
            ),
          ),

          // Accordion for each category
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10), 
                    
                    child: ExpansionTile(
                      onExpansionChanged: (bool expanded) {
                        setState(() {
                          if (expanded) {
                            expandedTiles.add(index);
                          } else {
                            expandedTiles.remove(index);
                          }
                        });
                      },
                      collapsedBackgroundColor: expandedTiles.contains(index) ? const Color.fromARGB(255, 223, 193, 228)  : Colors.white,
                      backgroundColor: expandedTiles.contains(index) ? const Color.fromARGB(255, 223, 193, 228) : Colors.white,
                      // collapsedBackgroundColor: const Color.fromARGB(255, 233, 233, 233),
                      // backgroundColor: Colors.blue,
                      title: Text(categories[index]),
                      //   collapsedShape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(0), // No border
                      //   side: BorderSide.none, // No side border
                      // ),
                      shape: const RoundedRectangleBorder(
                        
                        // borderRadius: BorderRadius.circular(0), // No border
                        side: BorderSide.none, // No side border
                      ),
                      children: [
                       Container(
                          color: Colors.white, // Ensure the ListTile background is white
                          child: const Column(
                            children: [
                              ListTile(title: Row(
                                children: [
                                  Chip(
                                    label: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 30),
                                      child: const Text('Subcategory 1'),
                                    )),
                                    Spacer(),
                                     Chip(
                                    label: const Text('Subcategory 1')),
                                ],
                              )
                              ),
                              ListTile(title: Row(
                                children: [
                                 CustomChip(text: 'Movies', imageUrl: 'assets/images/airplane.png')
                                ],
                              )
                              ),
                                ListTile(title: Row(
                                children: [
                                 CustomChip(text: 'Fruits & Vegetables', imageUrl: 'assets/images/taxi.png')
                                ],
                              )
                              ),
                              
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  final List<String> categories = [
    'Daily Needs',
    'Food',
    'Automobile',
    'B2B',
    'Baby Care',
    'Banquets',
    'Beauty',
  ];
}

