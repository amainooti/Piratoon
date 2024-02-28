import 'package:flutter/material.dart';


class Brand extends StatelessWidget {
  String brandImage;
  String brandTitle;

   Brand({Key? key, required this.brandImage, required this.brandTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Image.asset(brandImage),
          SizedBox(width: 10,),
          Text(brandTitle)
        ],
      ),
    );
  }
}
