import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/model/RestaurantResponse.dart';
import 'package:restaurant/ui/components/custom_card.dart';
import 'package:restaurant/ui/components/custom_shimmer.dart';
import 'package:restaurant/ui/pages/detail_screen.dart';
import 'package:restaurant/ui/theme/ColorTheme.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailScreen.routeName,
            arguments: restaurant);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 16),
        child: Expanded(
          child: Row(
            children: [
              Image.network(
                restaurant.pictureId,
                height: 150,
                width: 150,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Icon(
                            Icons.location_pin,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: restaurant.city,
                          style: blackTextStyle.copyWith(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Icon(
                            Icons.star,
                            size: 18,
                            color: ColorTheme.orangeColor,
                          ),
                        ),
                        TextSpan(
                          text: restaurant.rating.toString(),
                          style: blackTextStyle.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
