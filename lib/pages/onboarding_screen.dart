import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piratoon/components/build_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index){
              setState(() {
                setState( ()=> isLastPage = index == 2 );
              });
            },
            controller: controller,
            children: [
              PageBuild(
                  title: "Read comics and watch your favourite movies in one place",
                  imageUrl: "lib/images/male_illustration.png"
              )
              ,
              PageBuild(
                title: "Buy, collect, and build your own physical comic universe",
               imageUrl: "lib/images/female1_illustration.png"
              ),
              PageBuild(
                title: "Create, join and enjoy virtual parties with your friends",
                imageUrl: "lib/images/female2_illustration.png",
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50, // Adjust the height as needed
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    onDotClicked: (index) => controller.animateToPage(index,
                        duration: Duration(milliseconds: 250 ), curve: Curves.easeIn),
                    count: 3,
                    effect: WormEffect(
                      spacing: 16,
                      dotWidth: 8,
                      dotHeight: 8,
                      dotColor: Theme.of(context).colorScheme.tertiary,
                      activeDotColor: Theme.of(context).colorScheme.primary
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      // use controller to push to last page: Note; index starts from 0
                      controller.jumpToPage(2);
                    },
                    // change the Skip text if its the last page
                    child: Text( isLastPage ? "" : "Skip",
                      style: GoogleFonts.russoOne(color: Theme.of(context).colorScheme.secondary),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
