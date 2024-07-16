import 'package:flutter/material.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Welcome  <<userName>>',
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 15),
          ),
        ),
        body: Container(
          height: _height,
          width: _width,
          child: Column(
            children: [
              Container(
                height: _height / 4,
                child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      left: 20,
                      right: 20,
                      child: Container(
                        height: 100,
                        width: _width,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      top: 15,
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          'assets/images/rashmika.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 50,
                      top: 55,
                      child: Column(
                        children: [
                          Text(
                            'PDG Rtn. Suresh Hari',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              decorationColor: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Conference Counselor',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black54,
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/whatsapp_logo.jpeg'),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/phone_logo.png'),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 40,
                                width: 30,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/email-icon.jpg'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const SizedBox(
                                height: 150,
                                width: 150,
                                child: Image(
                                  image: ExactAssetImage(
                                    'assets/images/shivanandbellare.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Text(
                                  'Rtn.Shivanand Bellar',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                    decorationColor: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Chair.Conference Registration',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black54,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50, left: 20, right: 10),
                        child: Container(
                          height: 150,
                          width: _width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
