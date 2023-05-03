import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double percentage = 0.40;
    double total = 123.45;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(50),
        ),
        Align(
          alignment: Alignment.center,
          child: CircularPercentIndicator(
            radius: 150.0,
            lineWidth: 30.0,
            percent: percentage,
            startAngle: 270,
            center: Text(" ${percentage * 100} %"),
            progressColor: Colors.blueGrey,
            //footer: const Text("Your bal"),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
        ),
        Text("Your balance is: $total"),
        const Padding(
          padding: EdgeInsets.all(20),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.grey),
                ),
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("How much this time??"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 10,
                        actions: [
                          Column(
                            children: [
                              TextField(
                                autofocus: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        const Color.fromARGB(90, 0, 0, 0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                              ),
                              TextButton(
                                child: const Text("Done"),
                                onPressed: () => Navigator.of(context).pop(),
                              )
                            ],
                          ),
                        ],
                      );
                    }),
                child: const Icon(Icons.remove),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4),
            ),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.grey),
                ),
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("KEEP IT COMING"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 10,
                        actions: [
                          Column(
                            children: [
                              TextField(
                                autofocus: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        const Color.fromARGB(90, 0, 0, 0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                              ),
                              TextButton(
                                child: const Text("Done"),
                                onPressed: () => Navigator.of(context).pop(),
                              )
                            ],
                          ),
                        ],
                      );
                    }),
                child: const Icon(Icons.add),
              ),
            ),
          ],
        )
      ],
    );
  }
}
