import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_ui/UI/getstarted.dart';
import 'package:weather_ui/UI/openweatherapidata.dart';
import 'package:weather_ui/UI/weather_apidata.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  OpenweatherApiDataRequester api = OpenweatherApiDataRequester(
    location: 'New York',
  );

  Stream<ApiData> openweatherstreamdata() async* {
    yield* Stream.fromFuture(api.getData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leading: InkWell(
          child: Icon(
            Icons.ac_unit,
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (builder) => GetStarted(),
              ),
            );
          },
        ),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: Text(
          'Weather Forcast',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueGrey,
                Colors.black,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [1, 1],
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              currentWeather(),
              SizedBox(
                height: 25,
              ),
              nextSevenDaysForcast(),
              alldayforcaast(),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Chance of Rain',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              todayWeatherGraph(),
            ],
          ),
        ),
      ),
    );
  }

  Container todayWeatherGraph() {
    return Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
          bottom: 20,
        ),
        height: 200,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Rainy',
                      style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Sunny',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Heavy',
                      style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/graph2.jpg',
                      width: 323,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 60,
                ),
                Text(
                  '10 AM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  '12 AM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  '02 PM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  '05 PM',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  '07 PM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ));
  }

  Container nextSevenDaysForcast() {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            'Today',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                fontSize: 20),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'Tomorrow',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'Next 7 Days',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Container alldayforcaast() {
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.all(4),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Expanded(
            child: Container(
              width: 150,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 80,
                          top: 10,
                        ),
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          'assets/cloud2.png',
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 7,
                          left: 10,
                        ),
                        child: Text(
                          '10 AM',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 10),
                        child: RichText(
                            text: TextSpan(
                                text: '26',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                                children: [
                              TextSpan(
                                text: '°C',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ])),
                      )
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 150,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 80, top: 10),
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          'assets/cloud2.png',
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 7, left: 10),
                        child: Text(
                          '12 AM',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 10),
                        child: RichText(
                            text: TextSpan(
                                text: '27',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                                children: [
                              TextSpan(
                                text: '°C',
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ])),
                      )
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 150,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 80, top: 10),
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          'assets/cloud2.png',
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 7, left: 10),
                        child: Text(
                          '02 PM',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 10),
                        child: RichText(
                          text: TextSpan(
                            text: '28',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                            children: [
                              TextSpan(
                                text: '°C',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 150,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 80, top: 10),
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          'assets/cloud2.png',
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 7, left: 10),
                        child: Text(
                          '05 PM',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 10),
                        child: RichText(
                          text: TextSpan(
                            text: '29',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                            children: [
                              TextSpan(
                                text: '°C',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 150,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 80, top: 10),
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          'assets/cloud2.png',
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 7, left: 10),
                        child: Text(
                          '7:00 PM',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 10),
                        child: RichText(
                            text: TextSpan(
                                text: '26',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                                children: [
                              TextSpan(
                                  text: '°C',
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20))
                            ])),
                      )
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 150,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 80, top: 10),
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          'assets/cloud2.png',
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 7, left: 10),
                        child: Text(
                          '9:00 PM',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 10),
                        child: RichText(
                            text: TextSpan(
                                text: '30',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                                children: [
                              TextSpan(
                                text: '°C',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ])),
                      )
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  currentWeather() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Today',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 170,
              ),
              Text(
                'Thur, 30 Sep',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              StreamBuilder(
                stream: openweatherstreamdata(),
                builder: (context, AsyncSnapshot<ApiData> snapshot) {
                  if (snapshot.hasData) {
                    return RichText(
                      text: TextSpan(
                        text: snapshot.data!.temprature
                            .toString()
                            .substring(0, 2),
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        children: [
                          TextSpan(
                            text: '°C',
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 30,
                            ),
                          )
                        ],
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }

                  return CircularProgressIndicator(
                    color: Colors.amber,
                    backgroundColor: Colors.yellow,
                    strokeWidth: 7.0,
                  );
                },
              ),
              SizedBox(
                width: 110,
              ),
              StreamBuilder(
                stream: openweatherstreamdata(),
                builder: (context, AsyncSnapshot<ApiData> snapshot) {
                  if (snapshot.hasData) {
                    var currentweathericon = snapshot.data!.uiicon;
                    return Image.network(
                      "http://openweathermap.org/img/wn/$currentweathericon@2x.png",
                    );
                  }

                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }

                  return Container(
                    margin: EdgeInsets.only(left: 80),
                    child: CircularProgressIndicator(
                      color: Colors.amber,
                      backgroundColor: Colors.deepOrange,
                      strokeWidth: 7.0,
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.orange,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'MuslimTown,Lahore',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
            ],
          )
        ],
      ),
      height: 250,
      width: 370,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
