import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  final String name;
  final String date;
  final String hour;
  final String place;
  final String image;

  EventItem({
    required this.name,
    required this.image,
    required this.date,
    required this.hour,
    required this.place,
  });

  void selectEvent() {}

  // DateTime madate = DateTime.now();
  // DateTime xxx = new DateTime(2017,9,7,17,30);

  // String printDate() {
  //   return(xxx.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectEvent,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    image,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.place,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$place'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.calendar_today,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$date'),
                      //Text(printDate().toString()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
