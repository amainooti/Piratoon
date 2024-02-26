import 'package:flutter/material.dart';


class GenreTile extends StatelessWidget {
  String emoji;
  String title;
  final bool isSelected;
  GenreTile({Key? key, required this.emoji, required this.title, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiary,
      ),
      width: 90,
      height: 48,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: TextStyle(fontSize: 16),),
            SizedBox(width: 8,),
            Text(title)
          ]
      ),
    );
  }
}
