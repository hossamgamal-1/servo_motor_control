import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.transparent.withOpacity(.1),
      appBar: AppBar(
        title: const Text('Servo Motor App'),
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Team Members",
                style: TextStyle(fontSize: 48, color: Colors.black)),
            TeamMemberTile(name: 'حسام جمال', id: 20010477),
            TeamMemberTile(name: 'أحمد طارق', id: 20010117),
            TeamMemberTile(name: 'عبدالرحمن محمد', id: 20010837),
            TeamMemberTile(name: 'زينب يسري', id: 20012334),
            TeamMemberTile(name: 'أحمد خالد', id: 20010082),
          ],
        ),
      ),
    );
  }
}

class TeamMemberTile extends StatelessWidget {
  const TeamMemberTile({required this.name, required this.id, super.key});
  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "- $name -\n$id",
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
