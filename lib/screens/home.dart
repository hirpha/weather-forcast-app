import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/constants/global_variable.dart';
import '../provider/weather_provider.dart';
import '../widgets/country_cart.dart';
import '../widgets/error_message_builder.dart';
import '../widgets/loading_indicator.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  final TextEditingController searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context, ref) {
    var _data = ref.watch(countryDataProvider);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .03, left: 10, right: 10),
        child: ListView(
          children: [
            Container(
              height: 50,
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                focusNode: _focusNode,
                onChanged: (value) {
                  countryName = value.trim();
                },
                onFieldSubmitted: (value) {
                  countryName = value.trim();
                  _focusNode.unfocus();
                  _data = ref.refresh(countryDataProvider);
                },
                controller: searchController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        countryName = searchController.text.trim();
                        _focusNode.unfocus();
                        _data = ref.refresh(countryDataProvider);
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Color(0xffF58216),
                      ),
                    ),
                    label: const Text("search country capitals by region"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            _data.when(
                error: (erro, e) {
                  String errorMessage =
                      "Something went wrong, please check your internet and try again";
                  if (countryName.isNotEmpty) {
                    countryName = '';
                    errorMessage =
                        "Search not found, Country list load in seconds...";
                    _data = ref.refresh(countryDataProvider);
                  }
                  return ErrorMessageBuilder(errorMessage: errorMessage);
                },
                loading: () => const LoadingIndicator(),
                data: (d) {
                  return Container(
                    height: MediaQuery.of(context).size.height * .9,
                    child: ListView(
                      children: d
                          .map((country) => InkWell(
                                onTap: () {
                                  lat = country.latitude;
                                  lng = country.longitude;
                                  index = d.indexOf(country);
                                  ref.refresh(countryDetailProvider);
                                  GoRouter.of(context)
                                      .pushNamed("country_detail");
                                },
                                child: CountryBuilder(country: country),
                              ))
                          .toList(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
