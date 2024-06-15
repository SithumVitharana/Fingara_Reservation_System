import 'package:flutter/material.dart';

class Reservations extends StatefulWidget {
  const Reservations({super.key});

  @override
  State<Reservations> createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 100, // Adjust this value as needed
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      SizedBox(height: 5.0),
                      TabBar(
                        tabs: [
                          Tab(icon: Image.asset('images/icons/badminton_icon.png'), text: 'Badminton'),
                          Tab(icon: Image.asset('images/icons/tennis_icon.png'), text: 'Tennis'),
                          Tab(icon: Image.asset('images/icons/squash_icon.png'), text: 'Squash'),
                        ],
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.blue,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            BadmintonReservation(),
                            TennisReservation(),
                            SquashReservation(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
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

class TennisReservation extends StatefulWidget {
  @override
  _TennisReservationState createState() => _TennisReservationState();
}

class _TennisReservationState extends State<TennisReservation> {
  final TextEditingController _dateController = TextEditingController();
  String? _selectedStartTime;
  String? _selectedEndTime;

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage('images/tennis_home.jpeg')),
              SizedBox(height: 12.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tennis Reservations',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date: ',
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextField(
                            controller: _dateController,
                            decoration: InputDecoration(
                              labelText: 'DATE',
                              filled: true,
                              prefixIcon: Icon(Icons.calendar_today),
                              enabledBorder: OutlineInputBorder(),
                            ),
                            readOnly: true,
                            onTap: () {
                              _selectedDate(context); // Pass context here
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Time: ',
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 60.0,
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.black, width: 1.0),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                value: _selectedStartTime,
                                hint: Text('Select a Start time'),
                                items: <String>['5:00 PM', '6:00 PM', '7:00 PM', '8:00 PM', '9:00PM'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedStartTime = newValue;
                                  });
                                },
                                isExpanded: true,
                                underline: Container(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'End Time: ',
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 60.0,
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.black, width: 1.0),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                value: _selectedEndTime,
                                hint: Text('Select a End time'),
                                items: <String>['6:00 PM', '7:00 PM', '8:00 PM', '9:00 PM', '10:00 PM'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedEndTime = newValue;
                                  });
                                },
                                isExpanded: true,
                                underline: Container(),
                              ),
                            ),
                          ),
                      SizedBox(height: 18.0),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Payment Gateway Integration
                          },
                          child: Text('Reserve'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                            textStyle: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                      ],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0),
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

  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2029),
    );
    if (pickedDate != null) {
      _dateController.text = pickedDate.toString().split(" ")[0];
    }
  }
}



class BadmintonReservation extends StatefulWidget {
  @override
  _BadmintonReservationState createState() => _BadmintonReservationState();
}

class _BadmintonReservationState extends State<BadmintonReservation> {
  final TextEditingController _dateController = TextEditingController();
  String? _selectedStartTime;
  String? _selectedEndTime;

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage('images/badminton_home.jpg')),
              SizedBox(height: 12.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Badminton Reservations',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date: ',
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextField(
                            controller: _dateController,
                            decoration: InputDecoration(
                              labelText: 'Select a Date',
                              filled: true,
                              prefixIcon: Icon(Icons.calendar_today),
                              enabledBorder: OutlineInputBorder(),
                            ),
                            readOnly: true,
                            onTap: () {
                              _selectedDate(context); // Pass context here
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Time: ',
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 60.0,
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.black, width: 1.0),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                value: _selectedStartTime,
                                hint: Text('Select a Start time',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                items: <String>['5:00 PM', '6:00 PM', '7:00 PM', '8:00 PM', '9:00PM'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedStartTime = newValue;
                                  });
                                },
                                isExpanded: true,
                                underline: Container(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'End Time: ',
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 60.0,
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.black, width: 1.0),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                value: _selectedEndTime,
                                hint: Text('Select a End time',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                items: <String>['6:00 PM', '7:00 PM', '8:00 PM', '9:00 PM', '10:00 PM'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedEndTime = newValue;
                                  });
                                },
                                isExpanded: true,
                                underline: Container(),
                              ),
                            ),
                          ),
                          SizedBox(height: 18.0),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                // Payment Gateway Integration
                              },
                              child: Text('Reserve'),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                                textStyle: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0),
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

  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2029),
    );
    if (pickedDate != null) {
      _dateController.text = pickedDate.toString().split(" ")[0];
    }
  }
}


class SquashReservation extends StatefulWidget {
  @override
  _SquashReservationState createState() => _SquashReservationState();
}

class _SquashReservationState extends State<SquashReservation> {
  final TextEditingController _dateController = TextEditingController();
  String? _selectedStartTime;
  String? _selectedEndTime;

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage('images/squash_home.jpg')),
              SizedBox(height: 12.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Squash Reservations',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date: ',
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextField(
                            controller: _dateController,
                            decoration: InputDecoration(
                              labelText: 'DATE',
                              filled: true,
                              prefixIcon: Icon(Icons.calendar_today),
                              enabledBorder: OutlineInputBorder(),
                            ),
                            readOnly: true,
                            onTap: () {
                              _selectedDate(context); // Pass context here
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Time: ',
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 60.0,
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.black, width: 1.0),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                value: _selectedStartTime,
                                hint: Text('Select a Start time'),
                                items: <String>['5:00 PM', '6:00 PM', '7:00 PM', '8:00 PM', '9:00PM'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedStartTime = newValue;
                                  });
                                },
                                isExpanded: true,
                                underline: Container(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'End Time: ',
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 60.0,
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.black, width: 1.0),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                value: _selectedEndTime,
                                hint: Text('Select a End time'),
                                items: <String>['6:00 PM', '7:00 PM', '8:00 PM', '9:00 PM', '10:00 PM'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedEndTime = newValue;
                                  });
                                },
                                isExpanded: true,
                                underline: Container(),
                              ),
                            ),
                          ),
                          SizedBox(height: 18.0),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                // Payment Gateway Integration
                              },
                              child: Text('Reserve'),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                                textStyle: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0),
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

  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2029),
    );
    if (pickedDate != null) {
      _dateController.text = pickedDate.toString().split(" ")[0];
    }
  }
}
