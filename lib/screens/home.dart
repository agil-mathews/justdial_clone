import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_project/common/servicecard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _suggestionIndex = 0;

  final List<String> _suggestions = [
    'Restaurants near me',
    'Packers and movers',
    'Spa and salons',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        _suggestionIndex = (_suggestionIndex + 1) % _suggestions.length;
      });
    });
  }

  static  final List<Widget> _widgetOptions = <Widget>[
    const HomeContent(),
    NewsPage(),
    const AboutContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
              barrierColor: Colors.transparent,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                return  FullScreenMenu();
              },
              transitionBuilder: (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0)).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        title: Transform.scale(
                                    scale: 0.6,
                                    child: Image.asset('assets/images/HorizontalLogo.png',
                                    ),
                                  ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Add your onPressed code here!
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            SizedBox(
              height: 40, // Reduced height of the search bar
              child: TextField(
                decoration: InputDecoration(
                  hintText: _suggestions[_suggestionIndex],
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.mic),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0), // Adjust vertical padding

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30.0,left: 10.0,right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.article),
                label: 'News',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'About',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue[400],
            unselectedItemColor: Colors.white70,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

class FullScreenMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/electrician-service-1000x1000.jpg'), // Replace with your image path
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Full Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('Phone Number', style: TextStyle(fontSize: 14, color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.settings),
                        title: const Text('Settings'),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          // Add your onTap code here!
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.feedback),
                        title: const Text('App Feedback'),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          // Add your onTap code here!
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.share),
                        title: const Text('Share App'),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          // Add your onTap code here!
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.lock),
                        title: const Text('Privacy Policy'),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          // Add your onTap code here!
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.description),
                        title: const Text('Term of Use'),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          // Add your onTap code here!
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.update),
                        title: const Text('What\'s New'),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          // Add your onTap code here!
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.info),
                        title: const Text('About Us'),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          // Add your onTap code here!
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close, size: 30),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Flexible(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/handshake.png', width: 30, height: 30), // Replace with your image path
                      const SizedBox(height: 8),
                      const Text('B2b', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/aid-kit.png', width: 30, height: 30), // Replace with your image path
                      const SizedBox(height: 8),
                      const Text('Doctors ', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/airplane.png', width: 30, height: 30), // Replace with your image path
                      const SizedBox(height: 8),
                      const Text('Travel', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/taxi.png', width: 30, height: 30), // Replace with your image path
                      const SizedBox(height: 8),
                      const Text('Car Hire', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/beauty-blogger.png', width: 30, height: 30), // Replace with your image path
                      const SizedBox(height: 8),
                      const Text('Beauty', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                    Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/wedding.png', width: 30, height: 30), // Replace with your image path
                      const SizedBox(height: 8),
                      const Text('Wedding Plans', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                    Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/weightlifter.png', width: 30, height: 30), // Replace with your image path
                      const SizedBox(height: 8),
                      const Text('Gym', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                    Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/mortarboard.png', width: 30, height: 30), // Replace with your image path
                      const SizedBox(height: 8),
                      const Text('Education', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/van.png', width: 30, height: 30), // Replace with your image path
                      const SizedBox(height: 8),
                      const Text('Packers', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/maintenance.png', width: 30, height: 30), // Replace with your image path
                      const SizedBox(height: 8),
                      const Text('Repairs', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/rent.png', width: 30, height: 30), // Replace with your image path
                      const SizedBox(height: 8),
                      const Text('Rent', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/businessman.png', width: 30, height: 30), // Replace with your image path
                      const SizedBox(height: 8),
                      const Text('Jobs', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/loan.png', width: 30, height: 30), // Replace with your image path
                      const SizedBox(height: 8),
                      const Text('loan', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                    Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/house.png', width: 30, height: 30), // Replace with your image path
                      const SizedBox(height: 8),
                      const Text('Real Estate', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                    Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/hostel.png', width: 30, height: 30), // Replace with your image path
                      const SizedBox(height: 8),
                      const Text('Hostel', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                       Navigator.pushNamed(context, '/categories');
                  },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/show-more.png', width: 30, height: 30), // Replace with your image path
                        const SizedBox(height: 8),
                        const Text('Show More', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                 
                ],
              ),
            ),  
            
          ],
        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: bottomDetailsSheet()), 
      ],
    );

  }
}

Widget bottomDetailsSheet() {
  return DraggableScrollableSheet(
    initialChildSize: 0.5,
    minChildSize: 0.1,
    maxChildSize: 0.6,
    builder: (BuildContext context, ScrollController scrollController) {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, -3),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                const SizedBox(height: 8),
                Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 8),
                Column(
                  children: [
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Home Services',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100, // Adjust the height as needed
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ServiceCard(
                              image: 'assets/images/deep cleaning.jpg',
                              text: 'Deep Cleaning',
                            ),
                            ServiceCard(
                              image: 'assets/images/deep cleaning.jpg',
                              text: 'Deep Cleaning',
                            ),
                            ServiceCard(
                              image: 'assets/images/deep cleaning.jpg',
                              text: 'Deep Cleaning',
                            ),
                            ServiceCard(
                              image: 'assets/images/deep cleaning.jpg',
                              text: 'Deep Cleaning',
                            ),
                            ServiceCard(
                              image: 'assets/images/deep cleaning.jpg',
                              text: 'Deep Cleaning',
                            ),

                            // Add more containers for additional services
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Home Services',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100, // Adjust the height as needed
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ServiceCard(
                              image: 'assets/images/deep cleaning.jpg',
                              text: 'Deep Cleaning',
                            ),
                            ServiceCard(
                              image: 'assets/images/deep cleaning.jpg',
                              text: 'Deep Cleaning',
                            ),
                            ServiceCard(
                              image: 'assets/images/deep cleaning.jpg',
                              text: 'Deep Cleaning',
                            ),
                            ServiceCard(
                              image: 'assets/images/deep cleaning.jpg',
                              text: 'Deep Cleaning',
                            ),
                            ServiceCard(
                              image: 'assets/images/deep cleaning.jpg',
                              text: 'Deep Cleaning',
                            ),

                            // Add more containers for additional services
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}







class JobListScreen extends StatelessWidget {
  const JobListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    'Jobs',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 48), // Placeholder for spacing
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.account_balance),
                    title: const Text('Accounts'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Add your onTap code here!
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.business_center),
                    title: const Text('BPO'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Add your onTap code here!
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.work),
                    title: const Text('Office Assistant'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Add your onTap code here!
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.monetization_on),
                    title: const Text('Banks'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Add your onTap code here!
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.spa),
                    title: const Text('Beauty Salon'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Add your onTap code here!
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.call),
                    title: const Text('Call Centre'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Add your onTap code here!
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class NewsPage extends StatelessWidget {
  final List<String> categories = ['All', 'Business', 'Technology', 'Sports', 'Health', 'Science'];
  final List<Map<String, String>> news = [
    {
      'title': 'Flutter 2.0 Released',
      'image': 'https://via.placeholder.com/150',
      'source': 'TechCrunch',
    },
    {
      'title': 'New Vaccine Developed',
      'image': 'https://via.placeholder.com/150',
      'source': 'BBC News',
    },
    // Add more news items here
  ];

   NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle bell icon press
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container(
            height: 50.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Chip(
                    label: Text(categories[index]),
                    backgroundColor: Colors.white,
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.all(10.0),
            title: Text(news[index]['title']!),
            subtitle: Text(news[index]['source']!),
            leading: Image.network(news[index]['image']!),
          );
        },
      ),
    );
  }
}

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.info, size: 150),
    );
  }
}