import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/model/RestaurantResponse.dart';

class CustomCardDetail extends StatefulWidget {
  const CustomCardDetail({Key? key}) : super(key: key);

  @override
  State<CustomCardDetail> createState() => _CustomCardDetailState();
}

class _CustomCardDetailState extends State<CustomCardDetail> {
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
          color: Colors.white,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                _restaurantResponse!.pictureId,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      _restaurantResponse!.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Makanan",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
