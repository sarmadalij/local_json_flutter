import 'package:flutter/material.dart';
import 'dart:convert';
void main() => runApp(new MaterialApp(

  theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
    useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.orangeAccent,
  ),
  ),
  home: new HomePage(),
));

//home page class
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Load Json Data"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
             future: DefaultAssetBundle.of(context).loadString("jsondata/person.json"),
            builder: (context, snapshot){
               //decode JSON
              var mydata = JsonDecoder().convert(snapshot.data.toString());

              return new ListView.builder(
                  itemBuilder: (BuildContext context, int index){
                    return new Card(
                      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                        child: new Container(
                          padding: const EdgeInsets.all(10.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Name: "+mydata[index]['name']),
                              Text("Age: "+mydata[index]['age']),
                              Text("Height: "+mydata[index]['height']),
                              Text("Gender: "+mydata[index]['gender']),
                              Text("Hair Color: "+mydata[index]['hair_color']),
                            ],
                          ),
                        ),
                    );
                  },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
