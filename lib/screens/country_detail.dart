import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/provider/weather_provider.dart';

import '../constants/global_variable.dart';

class CountryDetail extends ConsumerWidget {
  const CountryDetail({super.key});
  @override
  Widget build(BuildContext context, ref) {
    var countryDetail = ref.watch(countryDetailProvider);
    return WillPopScope(
      onWillPop: () async {
        countryName = "";
        ref.refresh(countryDataProvider);
        return true;
      },
      child: Scaffold(
          backgroundColor: const Color(0xff14306F),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .03),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              ref.refresh(countryDetailProvider);
                              context.pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 50),
                              child: const Text(
                                "Slide view",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                    countryDetail.when(error: (err, s) {
                      return Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .27,
                          ),
                          const Icon(
                            Icons.info,
                            color: Colors.white,
                            size: 100,
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: const Text(
                              "Some thing went wrong please try again",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ));
                    }, loading: () {
                      return Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .25,
                          ),
                          Container(
                            width: 120,
                            height: 120,
                            child: const CircularProgressIndicator(
                              strokeWidth: 1,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Please wait...",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ));
                    }, data: (data) {
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) async {
                          index = index + 1;
                          // Fetch other data here
                          lat = allCountry[index].latitude;
                          lng = allCountry[index].longitude;
                          final data = ref.refresh(countryDetailProvider);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 400,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(top: 50),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Color(0xffffffff),
                                        size: 30,
                                      ),
                                      Container(
                                          child: Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          data.countryName!,
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffffffff)),
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .05),
                                  width: double.infinity,
                                  height: 100,
                                  child: Image.asset(
                                    'assets/cloud.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: Text(
                                "Chance of rain ${data.clouds}%",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: Text(
                                data.mainWeather!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 40),
                              height: 60,
                              width: MediaQuery.of(context).size.width * .4,
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left:
                                        MediaQuery.of(context).size.width * .05,
                                    right: 0,
                                    top: 0,
                                    child: Text(
                                      ((double.parse(data.temp!) - 273.15) *
                                                  9 /
                                                  5 +
                                              32)
                                          .toStringAsFixed(2),
                                      style: const TextStyle(
                                        fontSize: 45,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                      top: 0,
                                      right: 20,
                                      child: Text(
                                        "°F",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * .2,
                                  vertical: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _rowData(Icons.cloud, "${data.humidity}%"),
                                  _rowData(Icons.sunny, "0.5"),
                                  _rowData(Icons.wind_power_rounded,
                                      "${data.windSpeed} mp/h"),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ],
                )),
          )),
    );
  }

  Row _rowData(IconData icon, String data) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.white,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          data,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
