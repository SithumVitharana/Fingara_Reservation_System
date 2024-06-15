import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: AssetImage('images/fingara_club_home.jpg')),
                  SizedBox(height: 25.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome to,',
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Fingara Town and Country Club',
                          style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Text('THE FINGARA FAMILY CLUB DESIGNED WITH A NOVEL, MODERN AND FUNCTIONAL CONCEPT PRESENTS YOU A UNIQUE HOLIDAY EXPERIENCE.',
                          style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text('Celebrating 20 Years in the Hospitality Industry',
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text('Sports Facilities',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 34.0
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Card(
                          elevation: 5.0, // This adds a shadow to the card
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey, width: 2),
                          ),
                          child: Container(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 500.0,
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tennis',
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: Image.asset('images/tennis_home.jpeg'),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  'Well-maintained courts, practice facilities with ball machines, professional lessons, and competitive leagues and tournaments.',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                SizedBox(height: 20.0),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 20.0),

                        Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey, width: 2),
                          ),
                          child: Container(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 500.0,
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Badminton',
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: Image.asset('images/badminton_home.jpg'),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  'High-quality indoor courts, rental equipment available, professional coaching, and regular tournaments for all levels.',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                SizedBox(height: 20.0),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 20.0),

                        Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey, width: 2),
                          ),
                          child: Container(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 500.0,
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Squash',
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: Image.asset('images/squash_home.jpg'),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  "Well-maintained indoor courts, professional coaching, regular tournaments and ladders, plus adjacent fitness facilities for additional training.",
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 30.0),

                      ],
                    ),
                  ),
                ],
            ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (int index) {
        _onItemTapped(context, index);
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.calendar_month), label: 'Reservations'),
          NavigationDestination(icon: Icon(Icons.history), label: 'History'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

void _onItemTapped(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.pushNamed(context, '/home');
      break;
    case 1:
      Navigator.pushNamed(context, '/reservations');
      break;
    case 2:
      Navigator.pushNamed(context, '/history');
      break;
    case 3:
      Navigator.pushNamed(context, '/profile');
      break;
  }
}
