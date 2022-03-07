import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
      ),
      body: DefaultTabController(
        length: 2,
        child: TabBarView(
          children: <Widget>[
            ListView.builder(
              key: const PageStorageKey<String>(('list1')),
              itemCount: 100,
              itemBuilder: (context, index) {
                return Text("Hello+$index");
              },
            ),
            ListView.builder(
              key: const PageStorageKey<String>(('list2')),
              itemCount: 100,
              itemBuilder: (context, index) {
                return Text("Hello2+$index");
              },
            )
          ],
        ),
      ),
    );
  }
}
