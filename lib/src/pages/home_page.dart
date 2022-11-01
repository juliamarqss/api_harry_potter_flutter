import 'package:api_harry_potter_flutter/src/controllers/character_controller.dart';
import 'package:api_harry_potter_flutter/src/models/character_model.dart';
import 'package:api_harry_potter_flutter/src/service/character_service.dart';
import 'package:api_harry_potter_flutter/src/utils/house_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = CharacterController(service: CharacterService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Harry Potter - Characters'),
          backgroundColor: Colors.grey[800],
        ),
        body: SingleChildScrollView(
          child: FutureBuilder<List<Character>>(
              future: controller.getCharacters(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                      children: snapshot.data!
                          .map((i) => Container(
                                margin:
                                    EdgeInsets.only(left: 8, right: 8, top: 8),
                                child: Card(
                                    child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: ListTile(
                                    title: Text(i.name),
                                    leading: Container(
                                      height: 60,
                                      width: 60,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(i.image),
                                      ),
                                    ),
                                    trailing: Text(
                                      i.house,
                                      style:
                                          TextStyle(color: HouseColor(i.house)),
                                    ),
                                  ),
                                )),
                              ))
                          .toList());
                } else
                  return CircularProgressIndicator();
              }),
        ));
  }
}
