import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<String> categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
    'Category 5',
  ];

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
            padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 5.0),
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
            height: 1,
            thickness: 1,
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
            height: 60.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10.0),
                  child: Chip(
                    label: Text(categories[index]),
                  ),
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
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)), // Apply border radius only to the top corners
                        child: Container(
                          color: expandedTiles.contains(index) ? Colors.brown : Colors.white,
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
                            title: Text(categories[index]),
                            children: [
                              Container(
                                color: Colors.white, // Ensure the ListTile background is white
                                child: const Column(
                                  children: [
                                    ListTile(title: Text('Subcategory 1')),
                                    ListTile(title: Text('Subcategory 2')),
                                    ListTile(title: Text('Subcategory 3')),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8), // Add some space between items
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
