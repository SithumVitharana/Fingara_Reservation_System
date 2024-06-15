import 'package:flutter/material.dart';
import 'package:mad_individual_assignment/theme_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isFirstNameEnabled = false;
  bool _isLastNameEnabled = false;
  bool _isContactNumEnabled = false;
  bool _isEmailEnabled = false;
  bool _isPasswordEnabled = false;

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _contactNumController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _disableAllEditing() {
    setState(() {
      _isFirstNameEnabled = false;
      _isLastNameEnabled = false;
      _isContactNumEnabled = false;
      _isEmailEnabled = false;
      _isPasswordEnabled = false;
    });
  }

  void _toggleFirstName() {
    setState(() {
      _disableAllEditing();
      _isFirstNameEnabled = !_isFirstNameEnabled;
    });
  }

  void _toggleLastName() {
    setState(() {
      _disableAllEditing();
      _isLastNameEnabled = !_isLastNameEnabled;
    });
  }

  void _toggleContactNum() {
    setState(() {
      _disableAllEditing();
      _isContactNumEnabled = !_isContactNumEnabled;
    });
  }

  void _toggleEmail() {
    setState(() {
      _disableAllEditing();
      _isEmailEnabled = !_isEmailEnabled;
    });
  }

  void _togglePassword() {
    setState(() {
      _disableAllEditing();
      _isPasswordEnabled = !_isPasswordEnabled;
    });
  }

  void _onEditingComplete() {
    setState(() {
      _disableAllEditing();
    });
  }

  String _getPasswordHintText() {
    return _isPasswordEnabled ? '••••••••' : 'PeterA@2657';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                child: Text(
                  'Profile Information',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/user_profile.jpg'),
                  radius: 85.0,
                ),
              ),
              Container(
                margin: EdgeInsets.all(40.0),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Colors.grey[400]!,
                  ),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                          child: Text(
                            'User ID :',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'MEM01',
                              border: OutlineInputBorder(),
                            ),
                            enabled: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                              child: Text(
                                'First Name :',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  TextField(
                                    enabled: _isFirstNameEnabled,
                                    controller: _firstNameController,
                                    decoration: InputDecoration(
                                      hintText: 'Peter',
                                      border: OutlineInputBorder(),
                                    ),
                                    onEditingComplete: _onEditingComplete,
                                  ),
                                  GestureDetector(
                                    onTap: _toggleFirstName,
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.edit,
                                        color: _isFirstNameEnabled ? Colors.blue : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                              child: Text(
                                'Last Name :',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  TextField(
                                    enabled: _isLastNameEnabled,
                                    controller: _lastNameController,
                                    decoration: InputDecoration(
                                      hintText: 'Anderson',
                                      border: OutlineInputBorder(),
                                    ),
                                    onEditingComplete: _onEditingComplete,
                                  ),
                                  GestureDetector(
                                    onTap: _toggleLastName,
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.edit,
                                        color: _isLastNameEnabled ? Colors.blue : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                              child: Text(
                                'Contact Number :',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  TextField(
                                    enabled: _isContactNumEnabled,
                                    controller: _contactNumController,
                                    decoration: InputDecoration(
                                      hintText: '0771326549',
                                      border: OutlineInputBorder(),
                                    ),
                                    onEditingComplete: _onEditingComplete,
                                  ),
                                  GestureDetector(
                                    onTap: _toggleContactNum,
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.edit,
                                        color: _isContactNumEnabled ? Colors.blue : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                              child: Text(
                                'Email Address :',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  TextField(
                                    enabled: _isEmailEnabled,
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      hintText: 'peteranderson@gmail.com',
                                      border: OutlineInputBorder(),
                                    ),
                                    onEditingComplete: _onEditingComplete,
                                  ),
                                  GestureDetector(
                                    onTap: _toggleEmail,
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.edit,
                                        color: _isEmailEnabled ? Colors.blue : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                              child: Text(
                                'Password :',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  TextField(
                                    enabled: _isPasswordEnabled,
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                      hintText: _getPasswordHintText(),
                                      border: OutlineInputBorder(),
                                    ),
                                    obscureText: true,
                                    onEditingComplete: _onEditingComplete,
                                  ),
                                  GestureDetector(
                                    onTap: _togglePassword,
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.edit,
                                        color: _isPasswordEnabled ? Colors.blue : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Colors.grey[400]!,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.logout, size: 24.0),
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/login', (route) => false);
                            },
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.brightness_4, size: 24.0),
                            onPressed: () {
                              Provider.of<ThemeProvider>(context, listen: false)
                                  .toggleTheme();
                            },
                          ),
                          Text(
                            'Theme',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 35.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 3,
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
