import 'package:flutter/material.dart';
import 'package:weather_ui/UI/weather_page.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueGrey,
                Colors.black,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0, 1],
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 180),
                height: 170,
                width: 170,
                child: Image.asset(
                  'assets/cloud2.png',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 150, left: 70),
                child: Row(
                  children: [
                    Text(
                      'Weather',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'News',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '& Feed',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: Text(
                  'Thinking About Weather Cicumstances!.Get Notified With Latest Weather Updates Here',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  onPrimary: Colors.black,
                  padding: EdgeInsets.all(15),
                  minimumSize: Size(320, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  //startApp();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => WeatherPage(),
                    ),
                  );
                },
                child: Text(
                  'Get start',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
