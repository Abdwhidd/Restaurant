import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/model/RestaurantResponse.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  Restaurant? _restaurantResponse;

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/restaurant.json');
    final data = await json.decode(response);

    setState(() {
      _restaurantResponse = Restaurant.fromJson(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detailscreen');
      },
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  _restaurantResponse!.pictureId,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _restaurantResponse!.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.room,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Locations",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "4.5",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
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
