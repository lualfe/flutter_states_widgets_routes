import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_states_widgets_routes/models/Language.dart';

class AddLanguage extends StatelessWidget {
  AddLanguage({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nova Linguagem")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formkey, 
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Digite a linguagem",
                labelText: "Digite a linguagem"
              ),
              controller: _titleController,
              validator: (value){
                if (value == null || value.isEmpty) {
                  return "Insira o nome da lang";
                }

                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Digite a descrição",
                labelText: "Digite a descrição"
              ),
              controller: _subtitleController,
              validator: (value){
                if (value == null || value.isEmpty) {
                  return "Insira a descrição";
                }

                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16), 
              child: ElevatedButton(
                child: const Text("Gravar"),
                onPressed: (){
                  if (_formkey.currentState!.validate()) {
                    Language lang = Language(
                      _titleController.text, _subtitleController.text
                    );
                    Navigator.pop(context, lang);
                  }
                },
              ),
            )
          ],),
        ),
      ),
    );
  }
}