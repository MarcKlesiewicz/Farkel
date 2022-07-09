import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class EndgameDialog extends StatelessWidget {
  final String name;
  const EndgameDialog({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$name vandt!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Luk'))
            ],
          ),
        ),
      ),
    );
  }
}
