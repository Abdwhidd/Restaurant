import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/model/RestaurantResponse.dart';
import 'package:restaurant/ui/components/custom_card.dart';
import 'package:restaurant/ui/components/custom_shimmer.dart';
import 'package:restaurant/ui/pages/detail_screen.dart';
import 'package:restaurant/ui/theme/ColorTheme.dart';
import 'package:restaurant/ui/widget/card_decoration.dart';

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
              if (restaurantResponse == ConnectionState.waiting) {
                ShimmerLoaderUtils();
              }
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
      color: Colors.red,
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(top: 12, bottom: 10),
      child: Ink(
        decoration: cardDecoration(),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, DetailScreen.routeName,
                arguments: restaurant);
          },
          child: Row(
            children: [
              Hero(
                tag: restaurant.name,
                child: Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(restaurant.pictureId),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        child: Text(
                          restaurant.city,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: ColorTheme.orangeColor,
                              size: 16,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Text(
                                restaurant.rating.toString(),
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorTheme.orangeColor,
                ),
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
