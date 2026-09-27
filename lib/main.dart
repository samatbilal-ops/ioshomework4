
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileCard(),
    );
  }
}

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool isFollowing = false;
  bool isLiked = false;
  int likes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Card'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.person,
                    size: 60,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'Samat Bilal',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Junior Software Developer',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFollowing = !isFollowing;
                    });
                  },
                  child: Text(
                    isFollowing ? 'Following' : 'Follow',
                  ),
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;

                          if (isLiked) {
                            likes++;
                          } else {
                            likes--;
                          }
                        });
                      },
                      icon: Icon(
                        isLiked
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                        size: 35,
                      ),
                    ),

                    Text(
                      '$likes',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      isFollowing = false;
                      isLiked = false;
                      likes = 0;
                    });
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

