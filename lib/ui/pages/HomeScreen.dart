import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/model/RestaurantResponse.dart';
import 'package:restaurant/ui/components/CustomCard.dart';
import 'package:restaurant/ui/pages/DetailScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/json/restaurant.json'),
          builder: (context, snapshot) {
            try {
              final RestaurantResponse restaurantResponse =
                  restaurantResponseFromJson(snapshot.data! as String);
              return ListView.builder(
                itemCount: restaurantResponse.restaurants.length,
                itemBuilder: (context, index) {
                  return content(
                      context, restaurantResponse.restaurants[index]);
                },
              );
            } catch (e) {
              return setError(context);
            }
          }),
    );
  }

  Widget setError(BuildContext context) {
    return Container(
      color: Colors.purple,
      width: double.infinity,
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'There is something wrong',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }

  Widget content(BuildContext context, Restaurant restaurant) {
    return Material(
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.pushNamed(context, DetailScreen.routeName,
              arguments: restaurant);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Stack(
              children: [
                Image.network(
                  restaurant.pictureId,
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x80000000),
                        Color(0x80000000),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: Text(
                        restaurant.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const WidgetSpan(
                              child: Icon(
                                Icons.location_pin,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: restaurant.city,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const WidgetSpan(
                              child: Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: restaurant.rating.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
