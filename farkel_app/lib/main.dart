import 'package:farkel_app/widgets/add_player_dialog.dart';
import 'package:farkel_app/widgets/point_input.dart';
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
  List<PlayerModel> _players = [];
  PlayerModel _selectedPlayer = PlayerModel('', 0, 0);
  final TextEditingController _pointController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff457b9d),
        title: Center(
            child: Text(
          'Farkel',
          style: GoogleFonts.acme(fontSize: 28, color: Colors.white),
        )),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PointInput(
                onValidate: _validateScore,
                pointController: _pointController,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Spillere',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _players.length,
                  itemBuilder: (BuildContext context, int index) {
                    final player = _players[index];
                    return Dismissible(
                      onDismissed: ((direction) {
                        setState(() {
                          _selectedPlayer = PlayerModel('', 0, 0);
                          _players.removeAt(index);
                        });
                      }),
                      key: Key(player.toString()),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: _selectedPlayer.name == player.name
                                    ? Colors.orange
                                    : Color(0xff8d99ae),
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  _selectedPlayer = player;
                                });
                              },
                              textColor: Colors.white,
                              title: Text(
                                player.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              subtitle: Text(
                                'streak: ${player.streak}',
                              ),
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddPlayerDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  _openAddPlayerDialog(BuildContext conext) async {
    showDialog(context: context, builder: (context) => AddPlayerDialog())
        .then((value) {
      setState(() {
        _players.add(value);
      });
    });
  }

  _validateScore() {
    if (_selectedPlayer.name == '') return;
    for (var i = 0; i < _players.length; i++) {
      if (_selectedPlayer == _players[i]) {
        setState(() {
          if (_pointController.text != '') {
            _players[i].score += int.parse(_pointController.text);
            _players[i].streak++;
          } else {
            _players[i].streak = 0;
          }
          _pointController.clear();

          if (_selectedPlayer.name == _players.last.name) {
            _selectedPlayer = _players.first;
          } else {
            _selectedPlayer = _players[i + 1];
          }
        });
        return;
      }
    }
  }
}
