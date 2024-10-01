import 'package:elusiv/core/theme/themed_container.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Text('Elusiv'),
          SizedBox(height: 100,),
          ThemedContainer(
            child: IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.add)
            ),
          )
        ],
      ),
    );
  }
}