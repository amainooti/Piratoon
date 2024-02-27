import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class RecommendedTile extends StatelessWidget {
  String recommendText;
  RecommendedTile({Key? key, required this.recommendText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:12.0, left: 12),
      child: Container(
        margin: EdgeInsets.only(left: 20),
        width: 279,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
          color: Theme.of(context).colorScheme.tertiary,

        ),
        padding: EdgeInsets.only(left: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(recommendText, style: GoogleFonts.russoOne(
                  fontSize: 16
                ),),
                SizedBox(height: 12,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary, // Set the desired background color
                    ),
                    onPressed: (){ print('Read now');},
                    child: Text('Read Now', style: TextStyle(
                      color: Colors.white,
                    ),)
                )
              ],
            ),
            SizedBox(width: 14,),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(22),
                  bottomRight: Radius.circular(22)
              ),
              child: Image.asset(
                'lib/images/recommended_image.png',
                fit: BoxFit.cover,

              ),
            )

          ],
        ),
      ),
    );
  }
}
