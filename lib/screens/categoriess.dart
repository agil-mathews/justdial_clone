import 'package:flutter/material.dart';
import 'package:test_project/common/chip.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
//  final List<String> categories = [
//     'Daily Needs',
//     'Food',
//     'Automobile',
//     'B2B',
//     'Baby Care',
//     'Banquets',
//     'Beauty',
//   ];



     final List<Category> categories = [
  Category(title: 'Daily Needs', items: ['Movies', 'Grocery', 'Milk Products','Medicines','Electricians']),
  Category(title: 'Food', items: ['Cuisines', 'Home Delivery']),
  Category(title: 'Automobile', items: ['New Cars', 'Sell Cars', 'Used Cars','Sell two wheelers']),
  Category(title: 'B2B', items: ['Agriculture', 'Apparel', 'Personal care','Book','Baby care']),
  Category(title: 'Baby Care', items: ['Baby Food', 'Baby Sitters', 'Baby Bedding','Clothes','Diapers']),
  Category(title: 'Beauty', items: ['Beauty Parlours', 'Bridal makeup', 'Salons','Spas',]),
  // Add more categories as needed
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
           SliverAppBar(
            // backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 60.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('All categories',style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),),
              centerTitle: true,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SearchBarDelegate(),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _CategoryListDelegate(),
          ),
                 SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int categoryIndex) {
                final category = categories[categoryIndex];
                final List<String> itemsWithShowMore = List.from(category.items)
                  ..add('Show More');

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        category.title,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Grid of items under this category
                    SizedBox(
                      height: 190, // Adjust height as needed
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(8.0),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of items per row
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: 3.0, // Adjust as needed
                        ),
                         shrinkWrap: true,
                        itemCount: itemsWithShowMore.length,
                        itemBuilder: (BuildContext context, int itemIndex) {
                          if (itemIndex == itemsWithShowMore.length - 1) {
                            return const Wrap(
                              alignment: WrapAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: CustomChip(
                                    text: 'Show More',
                                    imageUrl: 'assets/images/handshake.png', // Replace with appropriate image URL
                                    // onTap: () {
                                    //   // Navigate to the next page when "Show More" is tapped
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => NextPage(), // Replace with your next page widget
                                    //     ),
                                    //   );
                                    // },
                                  ),
                                ),
                              ],
                            );
                          }
                          return Wrap(
                            alignment: WrapAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: CustomChip(
                                  text: itemsWithShowMore[itemIndex],
                                  imageUrl: 'assets/images/airplane.png', // Replace with appropriate image URL
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              childCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.center,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(_SearchBarDelegate oldDelegate) => false;
}

class _CategoryListDelegate extends SliverPersistentHeaderDelegate {
    final List<String> categories = [
    'Daily Needs',
    'Food',
    'Automobile',
    'B2B',
    'Baby Care',
    'Banquets',
    'Beauty',
  ];
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
            
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
            height: 40.0, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10.0),
                  child: Text(categories[index],style: const TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight: FontWeight.w600,color: Color.fromARGB(255, 57, 57, 57)),),
                );
              },
            ),
          );
  }

  @override
  double get maxExtent => 40.0;

  @override
  double get minExtent => 40.0;

  @override
  bool shouldRebuild(_CategoryListDelegate oldDelegate) => false;

  
}

class Category {
  final String title;
  final List<String> items;

  Category({required this.title, required this.items});





}

