import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 80,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/personal.png'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Salma Maher Hamed Alrabeiy',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '30105128800507',
                        style: TextStyle(fontSize: 18, letterSpacing: 2),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Egyptian',
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 1,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showImageDialog(context, 'assets/images/nationalid.png');
                    },
                    child: DocumentCard(
                      imagePath: 'assets/images/nationalid.png',
                      title: 'National ID',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showImageDialog(context, 'assets/images/pass.png');
                    },
                    child: DocumentCard(
                      imagePath: 'assets/images/passport.png',
                      title: 'Passport',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showImageDialog(context, 'assets/images/lic.png');
                    },
                    child: DocumentCard(
                      imagePath: 'assets/images/license.png',
                      title: 'License',
                    ),
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

class DocumentCard extends StatelessWidget {
  final String imagePath;
  final String title;

  DocumentCard({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.9), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showImageDialog(BuildContext context, String imagePath) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      );
    },
  );
}