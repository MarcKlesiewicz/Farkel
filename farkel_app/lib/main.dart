import 'package:farkel_app/widgets/add_player_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/player_model.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Farkel',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Farkel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PlayerModel> players = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff457b9d),
        title: Center(
            child: Text(
          'Farkel',
          style: GoogleFonts.amaticSc(
              fontSize: 38, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (BuildContext context, int index) {
              final player = players[index];
              return Dismissible(
                onDismissed: ((direction) {
                  setState(() {
                    players.removeAt(index);
                  });
                }),
                key: Key(player.toString()),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff8d99ae),
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        textColor: Colors.white,
                        title: Text(player.name),
                        trailing: Text(player.score.toString()),
                      ),
                    ),
                    SizedBox(height: 5)
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddPlayerDialog(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  _openAddPlayerDialog(BuildContext conext) async {
    showDialog(context: context, builder: (context) => AddPlayerDialog())
        .then((value) {
      setState(() {
        players.add(value);
      });
    });
  }
}
