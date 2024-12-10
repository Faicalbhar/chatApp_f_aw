import 'package:flutter/material.dart';
import 'package:realtime_chatapp_appwrite/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: const Text(
          "Chats",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: const AssetImage("assets/user.png"),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          onTap: () => Navigator.pushNamed(context, "/chat"),
          leading: Stack(
            children: [
              CircleAvatar(
                backgroundImage: const AssetImage("assets/user.png"),
              ),
              const Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.green,
                ),
              )
            ],
          ),
          title: const Text("Other User"),
          subtitle: const Text("hi how are you?"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: kBackgroundColor,
                radius: 10,
                child: const Text(
                  "10",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text("20:50"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
