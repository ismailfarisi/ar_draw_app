import 'package:ar_draw/ui/ar_screenpage/ar_screenpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR Draw'),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ArScreenPage())),
            child: Card(
              child: Container(
                child: Text("Draw with AR"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
