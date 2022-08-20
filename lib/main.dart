import 'package:flutter/material.dart';
import 'package:flutter_states_widgets_routes/customs/itemList.dart';
import 'package:flutter_states_widgets_routes/models/Language.dart';
import 'package:flutter_states_widgets_routes/screens/AddLanguage.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(),
        "/add": (context) => AddLanguage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List<Language> languages = [
    Language("Android", "Linguagens C, Java e Kotlin", Icons.android), 
    Language("Javascripto", "Ovo mata o Javascripto", Icons.javascript), 
    Language("IOS Nativo", "Swift", Icons.apple),
    Language("Ionic", "Linguagens Typescript e Javascript", Icons.blur_circular)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolha uma linguagem"),
        actions: [
          IconButton(onPressed: _goToNewLanguage, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            spacing: 10,
            children: buildChoices(),
          ),
          Expanded(child: ListView(children: buildListItems()))
        ],
      ),
    );
  }

  void _goToNewLanguage() {
    Future future = Navigator.pushNamed(context, "/add");
    future.then((lang) => {
      setState((){
        languages.add(lang);
      })
    });
  }

  List<Widget> buildChoices() {
    return languages.map((lang) => ChoiceChip(
      label: Text(lang.title), 
      selected: lang.selected, 
      onSelected: (value) {
        setState(() {
          lang.selected = value;
        });
      },)).toList();
  }

  List<Widget> buildListItems() {
    return languages.
      where((lang) => lang.selected).
      map((lang) => getItemList(lang.title, lang.subtitle, lang.icon != null ? lang.icon! : Icons.blur_circular)).toList();
  }
}
