import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int height = 150;
  int weight = 70;
  String gender='';
  late double bmi = calculateBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          gender='M';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: gender=='M' ? Colors.orange.withAlpha(150) : Colors.orange.withAlpha(50),
                          borderRadius: BorderRadius.circular(25)
                        ),
                        height: 200,
                        width: 175,
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const[
                            Icon(Icons.male, size: 150,),
                            Text('male')
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          gender='F';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: gender=='F' ? Colors.orange.withAlpha(150) : Colors.orange.withAlpha(50),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        height: 200,
                        width: 175,
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const[
                            Icon(Icons.female, size: 150,),
                            Text('female')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('height'),
                          Text("$height", style: TextStyle(fontSize: 50, color: Colors.pinkAccent, fontWeight: FontWeight.bold,),),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    if(height>50)
                                    height--;
                                    bmi=calculateBMI(height: height, weight: weight);
                                  });
                                },
                                child: Icon(Icons.remove, size: 40,),
                              ),
                              SizedBox(width: 10),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    if(height<220)
                                    height++;
                                    bmi=calculateBMI(height: height, weight: weight);
                                  });
                                },
                                child: Icon(Icons.add, size: 40,),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('weight'),
                          Text('$weight', style: kInputLabelColor,),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                  if(weight>35)
                                    weight--;
                                  bmi=calculateBMI(height: height, weight: weight);
                                  });
                                },
                                child: Icon(Icons.remove, size: 40,),
                              ),
                              SizedBox(width: 10),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                  if(weight<300)
                                    weight++;
                                  bmi=calculateBMI(height: height, weight: weight);
                                  });
                              },
                                child: Icon(Icons.add, size: 40,),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50,),
                Column(
                  children: [
                    Text('BMI'),
                    Text('${bmi.toStringAsFixed(2)}', style: kInputLabelColor.copyWith(color: kOutputTextColor, fontSize: 60),),
                    Text(getResult(bmi)),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }

  double calculateBMI({required int height, required int weight})
  {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmiValue){
    if(bmiValue>=25)
      return 'Over Weight';
    else if(bmiValue>18.5)
      return 'Normal';
    else
      return 'Under Weight';
  }
}


