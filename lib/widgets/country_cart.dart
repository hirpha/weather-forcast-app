import 'package:flutter/material.dart';

import '../model/country.dart';

class CountryBuilder extends StatelessWidget {
  final Country country;
  const CountryBuilder({required this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0xffDDDDDD),
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 0.0),
            )
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: const Color(
                0xffE4E4E4,
              ),
              strokeAlign: 1)),
      margin: const EdgeInsets.all(10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            const Icon(
              Icons.location_on,
              color: Color(0xff5884D7),
              size: 30,
            ),
            Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    country.name,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5884D7)),
                  ),
                ))
          ],
        ),
        Column(
          children: [
            Container(
              child: Image.asset(
                'assets/cloud.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * .3,
              child: Text(
                country.capital,
                softWrap: true,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff555555)),
              ),
            ),
            const Text("24 degrees",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff555555)))
          ],
        )
      ]),
    );
  }
}
