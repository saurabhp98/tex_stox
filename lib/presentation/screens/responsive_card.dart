import 'package:flutter/material.dart';

class ResponsiveCard extends StatelessWidget {
  const ResponsiveCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
////************ Responsiveness Using LayoutBuider **************////

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LayoutBuilder(
                builder: (context, constraints) => Container(
                  width: constraints.maxWidth,
                  height: 100,
                  color: Color(0xFFD18585),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        LayoutBuilder(builder: (context, constraints) {
                          return Container(
                            height: 25,
                            color: Color(0xFFC4C4C4),
                            width: constraints.maxWidth * 0.4,
                          );
                        }),
                        LayoutBuilder(builder: (context, constraints) {
                          return Container(
                            height: 30,
                            color: Color(0xFFA8D8AD),
                            width: constraints.maxWidth * 0.95,
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            LayoutBuilder(builder: (context, constraints) {
              return Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 5, left: 10, right: 10),
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Container(
                          height: 100,
                          width: constraints.maxWidth * 0.9,
                          color: Color(0xFFD18585),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(height: 30),
                              LayoutBuilder(builder: (context, constraints) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 5, right: 10, left: 10),
                                  child: Container(
                                    color: Color(0xFFA8D8AD),
                                    width: constraints.maxWidth,
                                    height: 30,
                                  ),
                                );
                              })
                            ],
                          ),
                        );
                      }),
                    ),
                    Align(
                      alignment: Alignment(-0.12, 0.5),
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Container(
                          color: Color(0xFFC4C4C4),
                          width: constraints.maxWidth / 4,
                          height: 40,
                        );
                      }),
                    )
                  ],
                ),
              );
            })
          ],
        ));
  }
}

////************ Responsiveness MediaQuery LayoutBuider **************////

// Scaffold(
//         body: Column(
//       children: [
//         SizedBox(
//           height: 40,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: 100,
//             color: Colors.orange,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     height: 30,
//                     color: Colors.grey,
//                     width: MediaQuery.of(context).size.width * 0.4,
//                   ),
//                   Container(
//                     height: 30,
//                     color: Colors.green,
//                     width: MediaQuery.of(context).size.width * 0.9,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 40,
//         ),
//         Expanded(
//             child: Container(
//           color: Colors.white,
//           child: Stack(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Expanded(
//                   child: Container(
//                     height: 100,
//                     color: Colors.orange,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         SizedBox(height: 30),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             color: Colors.green,
//                             width: MediaQuery.of(context).size.width * 0.98,
//                             height: 30,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment(0, -1.03),
//                 child: Container(
//                   color: Colors.grey,
//                   width: MediaQuery.of(context).size.width / 4,
//                   height: 30,
//                 ),
//               )
//             ],
//           ),
//         ))
//       ],
//     ));