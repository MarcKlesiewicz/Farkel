import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
class PointInput extends StatelessWidget {
  final Function() onAdd;
  final Function() onDismissed;
  final TextEditingController pointController;
  const PointInput(
      {Key? key,
      required this.onAdd,
      required this.onDismissed,
      required this.pointController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 100, right: 100),
          child: TextFormField(
            controller: pointController,
            keyboardType: TextInputType.number,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.center,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white, fontSize: 28),
            decoration: InputDecoration(
              hintText: '0',
              hintStyle: TextStyle(color: Colors.white, fontSize: 28),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: onDismissed,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Icon(Icons.error_outline),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
            ElevatedButton(
              onPressed: onAdd,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Icon(Icons.arrow_forward),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
          ],
        )
      ],
    );
  }
}
