import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Message Card App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
        appBarTheme: AppBarTheme(backgroundColor: Colors.orange),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  Color themecolor = Colors.red;
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Message Card App')),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 200.0,
              width: 400.0,
              color: themecolor,
              child: Center(
                child: Text(
                  message,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // clear the message using these function
              controller: controller,
              onChanged: (String newValue) {
                setState(() {
                  message = newValue;
                });
              },
              maxLength: 30,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: themecolor),
                ),
                prefixIcon: Icon(Icons.edit, color: themecolor),
                hintText: 'Enter the message as you like',
                helperText: 'YOU CAN WRITE YOUR MESSAGE HERE',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  controller.clear();
                  message = '';
                });
              },
              child: Text('CLICK THE BUTTON'),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: CircleAvatar(backgroundColor: Colors.red),
                    onTap: () {
                      setState(() {
                        themecolor = Colors.red;
                      });
                    },
                  ),
                  InkWell(
                    child: CircleAvatar(backgroundColor: Colors.green),
                    onTap: () {
                      setState(() {
                        themecolor = Colors.green;
                      });
                    },
                  ),
                  InkWell(
                    child: CircleAvatar(backgroundColor: Colors.blue),
                    onTap: () {
                      setState(() {
                        themecolor = Colors.blue;
                      });
                    },
                  ),
                  InkWell(
                    child: CircleAvatar(backgroundColor: Colors.orange),
                    onTap: () {
                      setState(() {
                        themecolor = Colors.orange;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
