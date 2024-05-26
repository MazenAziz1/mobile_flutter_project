import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red, // Customize theme
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.only(top: 40),
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
              ListTile(
                leading: Icon(Icons.build),
                title: Text('Services'),
                onTap: () {
                  Navigator.pushNamed(context, '/services');
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Help Center'),
                onTap: () {
                  Navigator.pushNamed(context, '/help');
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('login');
                  },
                  child: Text('Sign Out'),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center, // Center the buttons
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'National ID',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        minimumSize: Size(250, 100),
                      ),
                    ),
                    SizedBox(height: 20), // Adjust spacing
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Passport',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        minimumSize: Size(250, 100),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'License',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        minimumSize: Size(250, 100),
                      ),
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
}
