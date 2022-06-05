import 'package:farkel_app/models/player_model.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class AddPlayerDialog extends StatelessWidget {
  const AddPlayerDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Dialog(
      child: Form(
        key: _formKey,
        child: SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tilføj ny spiller'),
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (_nameController.text.isEmpty) {
                      return 'Bare skriv noget!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: 'Navn'),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      } else {
                        Navigator.pop(
                            context, PlayerModel(_nameController.text, 0));
                      }
                    },
                    child: Text('Tilføj'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
