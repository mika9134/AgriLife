//import 'package:ag/home_page.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

//class OnboardingPage extends StatelessWidget {
//  const OnboardingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         //minimum: const EdgeInsets.all(20),
//         child: Center(
//           child: Column(
//             children: [
//               //const Spacer(),
//               Image(
//                 //constraints: const BoxConstraints(),
//                 // child: const Image(
// image: AssetImage('/C:/vsRepo/Agrilife/assets/plant.jpg'),
//                 fit: BoxFit.cover,
//               ),
//               const Spacer(),
//               Positioned(
//                 top: 100,
//                 left: 50,
//                 child: Column(
//                   children: [
//                     Text('Welcome to Agriplant',
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleLarge
//                             ?.copyWith(fontWeight: FontWeight.bold)),
//                     const Padding(
// padding: EdgeInsets.only(top: 30, bottom: 30),
//                       child: Text(
//                         "Get your agriculture products from the comfort of your home. You're just a few clicks away from your favorite products.",
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     /**/
// FilledButton.tonalIcon(
//   onPressed: () {
//     Navigator.of(context).pushReplacement(
//         CupertinoPageRoute(
//             builder: (context) => const HomePage()));
//   },
//   icon: const Icon(IconlyLight.login),
//   label: const Text("Continue with Google"),
// )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:ag/home_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Background image
            Image.asset(
              '/C:/vsRepo/Agrilife/assets/pl2.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),

            // Text and button positioned on top
            Positioned(
              top: 400,
              // padding: const EdgeInsets.only(top: 30, bottom: 30),
              left: 250,
              child: Column(
                children: [
                  Text(
                    'Welcome to Agriplant',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          //fontFamily:
                        ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                    child: Text(
                      "Get your agriculture products from the comfort of your home. You're just a few clicks away from your favorite products.",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FilledButton.tonalIcon(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(CupertinoPageRoute(
                          builder: (context) => const HomePage()));
                    },
                    icon: const Icon(IconlyLight.login),
                    label: const Text("Continue with Google"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
