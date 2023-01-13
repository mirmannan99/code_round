import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/home_view_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeViewModel provider = Provider.of<HomeViewModel>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manage Availibility",
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Monday",
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.indigo,
                  value: provider.checkBox1,
                  onChanged: (value) {
                    provider.checkbox();
                  },
                  shape: CircleBorder(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: RadioListTile(
                            title: Text("Daily"),
                            value: "0",
                            activeColor: Colors.indigo,
                            groupValue: provider.type,
                            onChanged: (value) {
                              provider.typeOf = value;
                            },
                          ),
                        ),
                        Flexible(
                          child: RadioListTile(
                            title: Text("Time Slots"),
                            value: "1",
                            activeColor: Colors.indigo,
                            groupValue: provider.type,
                            onChanged: (value) {
                              provider.typeOf = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  time(int.parse(provider.type.toString())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget time(int type) {
    switch (type) {
      case 1:
        return GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              mainAxisExtent: 30,
              crossAxisCount: 4),
          children: provider.timeSlot
              .map((e) => Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        );
      case 0:
        return Container();

      default:
        return Container();
    }
  }
}
