import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var space = 10.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.accessibility,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(width: space),
            Text('GUESS THE NUMBER')
          ],
        ) ,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Please guess the number between 1 and 100'),
          TextField(),
          OutlinedButton(
              onPressed: (){
                //todo:
              },
              child: Text('guess')),
        ],
      ),
    );
  }
}
