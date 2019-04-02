import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  _airDress (){
    print( '_airDress');
  }
  _restitchDress (){
    print( '_restitchDress');
  }
  _repairDress (){
    print( '_repairDress');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.playlist_play),
            tooltip: 'Air it',
            onPressed: _airDress,
          ),
          IconButton(
            icon: Icon(Icons.playlist_add),
            tooltip: 'Restitch it',
            onPressed: _restitchDress,
          ),
          IconButton(
            icon: Icon(Icons.playlist_add_check),
            tooltip: 'Repair it',
            onPressed: _repairDress,
          ),
        ],
      ),
      body: Center(
        child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.png', fit: BoxFit.contain,),
      ),
    );
  }
}