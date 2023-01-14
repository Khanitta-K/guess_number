import 'package:flutter/material.dart';
import 'package:guess_number/pages/game/game.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = TextEditingController();
  final _game = Game(maxRandom: 100);
  var _feedBackText = '';
  var _boxCount = 0;
  var _showBox = true;
  @override
  Widget build(BuildContext context) {
    var brownBox = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(width: 20, height: 20, color: Colors.brown),
    );
    var orangeBox = Container(width: 20, height: 20, color: Colors.orange);
    var boxList = <Widget>[];
    for(var i = 0; i< _boxCount ; i++){
      boxList.add(brownBox);
    }

    return Scaffold(
      appBar: AppBar(
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
            SizedBox(width: 10),
            Text('GUESS THE NUMBER'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _showBox? boxList : [] ,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: Text(
                      'Please guess the number between 1 and 100',
                      style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).primaryColor,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your guess',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: OutlinedButton(
                      onPressed: () {
                        //todo:
                        var input = _controller.text;
                        var guess = int.tryParse(input);

                        var result = _game.doGuess(guess!);

                        setState(() {
                          if(result == GuessResult.correct){
                            _feedBackText = 'Correct!!';
                          }else if(result == GuessResult.tooHigh){
                            _feedBackText = 'TOO High, Please try again';
                          }else{
                            _feedBackText = 'TOO LOW, Please try again';
                          }
                        });

                        print(result);
                      },
                      child: Text('GUESS'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: (){
                          setState(() {
                            _boxCount++;
                          });

                        },
                        child: Text('TEST')
                    ),
                  ),
                  OutlinedButton(
                      onPressed: (){
                          setState(() {
                            _showBox = !_showBox;
                          });
                      },
                      child: Text('TOGGLE')
                  ),
                ],
              ),
            ),
            Text(_feedBackText),
          ],
        ),
      ),
    );
  }
}
