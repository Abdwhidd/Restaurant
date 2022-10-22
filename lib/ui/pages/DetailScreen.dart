import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restaurant/model/RestaurantResponse.dart';
import 'package:restaurant/ui/components/CustomCardDetail.dart';
import 'package:restaurant/ui/components/CustomFavoriteButton.dart';
import 'package:restaurant/ui/theme/ColorTheme.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detailscreen';
  final Restaurant restaurant;
  const DetailScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
        backgroundColor: ColorTheme.orangeColor,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Hero(
                tag: restaurant.pictureId,
                child: Image.network(
                  restaurant.pictureId,
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                            color: ColorTheme.blackColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      CustomFavoriteButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      size: 24,
                      color: ColorTheme.blackColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.city,
                            style: const TextStyle(
                                color: ColorTheme.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            'Jl. Lorem Ipsum No. 10',
                            style: TextStyle(color: ColorTheme.greyColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.star,
                      color: ColorTheme.orangeColor,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      restaurant.rating.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                      color: ColorTheme.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    restaurant.description,
                    style: const TextStyle(
                      color: ColorTheme.blackColor,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text(
                    'Foods',
                    style: TextStyle(
                      color: ColorTheme.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: restaurant.menus.foods!
                          .map(
                            (food) => Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                color: ColorTheme.greyColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  food.name!,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text(
                    'Drinks',
                    style: TextStyle(
                      color: ColorTheme.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: restaurant.menus.drinks!
                          .map((drink) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                decoration: BoxDecoration(
                                  color: ColorTheme.greyColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    drink.name!,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
