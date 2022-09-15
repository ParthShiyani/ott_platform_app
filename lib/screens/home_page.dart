import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ott_plateform_app/models/applications.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Application> appList = [];

  lodeJasonBank() async {
    String jsonData = await rootBundle.loadString("assets/json/data.json");
    List res = jsonDecode(jsonData);
    setState(() {
      appList = res.map((e) => Application.fromJSON(e)).toList();
    });
  }

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    lodeJasonBank();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Ott Platform App"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: appList.length,
          itemBuilder: (context, i) => Container(
            margin: const EdgeInsets.only(top: 15),
            child: Card(
              child: ListTile(
                isThreeLine: true,
                leading: SizedBox(
                  width: 80,
                  height: double.infinity,
                  child: Image.asset(
                    appList[i].logo,
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(
                  "${appList[i].name}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  "${appList[i].website}",
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed("details_page", arguments: appList[i]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
