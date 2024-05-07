import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentButton = 0;
  List<String> buttonList01 = [
    "https://raw.githubusercontent.com/JorgeMeza123/img_flutterflow_IOS_6J/main/Act12NavBar_Flutterflow/turbo.jpg",
    "https://raw.githubusercontent.com/JorgeMeza123/img_flutterflow_IOS_6J/main/Act12NavBar_Flutterflow/turbo.jpg",
  ];
  List<String> buttonList02 = [
    "https://raw.githubusercontent.com/JorgeMeza123/img_flutterflow_IOS_6J/main/supercargador.jpg",
    "https://raw.githubusercontent.com/JorgeMeza123/img_flutterflow_IOS_6J/main/supercargador.jpg",
  ];
  List<String> buttonList03 = [
    "https://raw.githubusercontent.com/JorgeMeza123/img_flutterflow_IOS_6J/main/twinturbo.jpg",
    "https://raw.githubusercontent.com/JorgeMeza123/img_flutterflow_IOS_6J/main/twinturbo.jpg",
  ];
  List<String> mainList = [];

  @override
  void initState() {
    // TODO: implement initState
    mainList = buttonList01;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Color(0xff8c0000),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 30.0, bottom: 30.0),
                child: Text(
                  "Refaccionaria\nMeza",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mainList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return RotatedBox(
                        quarterTurns: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentButton = 2;
                                    mainList = buttonList03;
                                  });
                                },
                                child: Text("TwinTurbo",
                                    style: TextStyle(
                                      color: currentButton == 2
                                          ? Colors.amber
                                          : Colors.black,
                                    )),
                              ),
                              SizedBox(
                                width: 80.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentButton = 1;
                                    mainList = buttonList02;
                                  });
                                },
                                child: Text("Supercargador",
                                    style: TextStyle(
                                      color: currentButton == 1
                                          ? Colors.amber
                                          : Colors.black,
                                    )),
                              ),
                              SizedBox(
                                width: 100.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentButton = 0;
                                    mainList = buttonList01;
                                  });
                                },
                                child: Text(
                                  "Turbo",
                                  style: TextStyle(
                                    color: currentButton == 0
                                        ? Colors.amber
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(20.0),
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.network(
                                    mainList[index - 1],
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child:
                                Text("Turbo", style: TextStyle(fontSize: 26)),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20, bottom: 26.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xffff0707),
                                ),
                                Text("Turbo de 100 lb de presion de aire",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey))
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
