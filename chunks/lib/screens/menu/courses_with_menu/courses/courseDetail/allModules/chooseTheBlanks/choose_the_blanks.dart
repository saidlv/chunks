import 'dart:ui';

import 'package:chunks/responsiveBloc/size_config.dart';
import 'package:chunks/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseTheBlanks extends StatefulWidget {
  @override
  State<ChooseTheBlanks> createState() => _ChooseTheBlanksState();
}

class _ChooseTheBlanksState extends State<ChooseTheBlanks> {
  TextEditingController description = TextEditingController();
  List<String> quizoptions = ['Bonn', 'Berlin', 'Ankara', 'Rom', 'X', 'Y', 'Z'];
  String firstText = '';
  String secondText = '';
  bool firstTextSelected = false;
  bool showOptionsBlock = false;
  bool showDescriptionBlock = false;
  bool showCongratsBlock = false;

  List<dynamic> optionsText = [
    {
      'content': 'Die Lösung ist falsch.',
      'selected': false,
    },
    {
      'content': 'Tippfehler melden.',
      'selected': false,
    },
    {
      'content': 'kompliziert zu verstehen.',
      'selected': false,
    },
    {
      'content': 'Etwas anderes.',
      'selected': false,
    },
  ];

  @override
  void dispose() {
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.appBackgroundColor,
            appBar: appBar(context, screenWidth),
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                children: [
                  SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                runSpacing: 10,
                                crossAxisAlignment: WrapCrossAlignment.end,
                                children: [
                                  Text(
                                    'The capital of germany is',
                                    style: TextStyle(
                                        color: theme.darkTextColor,
                                        fontSize: screenWidth * 4),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        firstText,
                                        style: TextStyle(
                                            color: theme.darkTextColor,
                                            fontSize: screenWidth * 4.1),
                                      ),
                                      Container(
                                        width: screenWidth * 20,
                                        height: 1,
                                        color: theme.darkTextColor,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '& the capital of',
                                    style: TextStyle(
                                        color: theme.darkTextColor,
                                        fontSize: screenWidth * 4),
                                  ),
                                  Text(
                                    'england is',
                                    style: TextStyle(
                                        color: theme.darkTextColor,
                                        fontSize: screenWidth * 4),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        secondText,
                                        style: TextStyle(
                                            color: theme.darkTextColor,
                                            fontSize: screenWidth * 4.1),
                                      ),
                                      Container(
                                        width: screenWidth * 20,
                                        height: 1,
                                        color: theme.darkTextColor,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '.',
                                    style: TextStyle(
                                        color: theme.darkTextColor,
                                        fontSize: screenWidth * 4),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenWidth * 6,
                              ),
                              Wrap(
                                children: [
                                  for (int i = 0; i < quizoptions.length; i++)
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (!firstTextSelected) {
                                                firstText = quizoptions[i];
                                                firstTextSelected = true;
                                              } else {
                                                secondText = quizoptions[i];
                                              }
                                            });
                                          },
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: screenWidth * 5,
                                                  vertical: screenWidth * 3),
                                              margin: EdgeInsets.only(
                                                  right: screenWidth * 4,
                                                  bottom: screenWidth * 3),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        screenWidth * 30),
                                                color: theme.appBackgroundColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset:
                                                          const Offset(3, 3),
                                                      blurRadius: 3,
                                                      spreadRadius: 1,
                                                      color: Colors
                                                          .grey.shade400
                                                          .withOpacity(.7)),
                                                  BoxShadow(
                                                      offset:
                                                          const Offset(-1, -1),
                                                      blurRadius: 3,
                                                      spreadRadius: 1,
                                                      color: Colors.white70),
                                                ],
                                              ),
                                              child: Text(quizoptions[i],
                                                  style: TextStyle(
                                                      color:
                                                          theme.darkTextColor,
                                                      fontSize:
                                                          screenWidth * 3.1))),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ],
                          ),
                          firstText.isEmpty || secondText.isEmpty
                              ? SizedBox()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: screenWidth * 3,
                                      ),
                                      padding:
                                          EdgeInsets.all(screenWidth * 3.5),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: theme.whiteColor,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: const Offset(3, 3),
                                                blurRadius: 3,
                                                spreadRadius: 1,
                                                color: Colors.grey.shade400
                                                    .withOpacity(.7)),
                                            BoxShadow(
                                                offset: const Offset(-1, -1),
                                                blurRadius: 3,
                                                spreadRadius: 1,
                                                color: Colors.white70),
                                          ],
                                          borderRadius: BorderRadius.circular(
                                              screenWidth * 3)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset('assets/bulb_icon.png',
                                              height: screenWidth * 4,
                                              width: screenWidth * 4),
                                          SizedBox(
                                            width: screenWidth * 2,
                                          ),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Comment',
                                                  style: TextStyle(
                                                      color:
                                                          theme.darkTextColor,
                                                      fontSize:
                                                          screenWidth * 4.2,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  'Good Job! You should know that the Capital of West Germany\nwas Bonn.',
                                                  style: TextStyle(
                                                      color: theme.darkTextColor
                                                          .withOpacity(.8),
                                                      fontSize:
                                                          screenWidth * 2.9,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ])
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenWidth * 2,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.of(context).push(MaterialPageRoute(
                                        //     builder: (context) => Registration()));
                                      },
                                      child: Container(
                                        height: screenWidth * 12,
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: firstText == 'Berlin' &&
                                                  secondText == 'Rom'
                                              ? Colors.green.shade600
                                              : Colors.red.shade600,
                                          borderRadius: BorderRadius.circular(
                                              screenWidth * 50),
                                          boxShadow: theme.boxShadow,
                                        ),
                                        child: Text(
                                          'Weiter',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: theme.whiteColor,
                                              fontSize: screenWidth * 4,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                        ],
                      ),
                    ),
                  ),
                  !showOptionsBlock
                      ? SizedBox()
                      : BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Center(
                              child: Container(
                                height: screenWidth * 80,
                                width: screenWidth * 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        theme.lightTextColor.withOpacity(.8)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showOptionsBlock = false;
                                            });
                                          },
                                          child: Container(
                                            height: screenWidth * 8,
                                            width: screenWidth * 8,
                                            decoration: BoxDecoration(
                                                color: theme.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Icon(
                                              Icons.close,
                                              size: screenWidth * 4,
                                              color: theme.mainColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenWidth * 4,
                                      ),
                                      for (int i = 0; i < 4; i++)
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              optionsText[i]['selected'] =
                                                  !optionsText[i]['selected'];
                                            });
                                            optionsText.forEach((element) {
                                              if (element == optionsText[i]) {
                                              } else {
                                                element['selected'] = false;
                                              }
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                bottom: screenWidth * 3),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: screenWidth * 4.5,
                                                  width: screenWidth * 4.5,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: optionsText[i]
                                                              ['selected']
                                                          ? theme.mainColor
                                                          : theme.whiteColor),
                                                ),
                                                SizedBox(
                                                    width: screenWidth * 2),
                                                Text(
                                                  optionsText[i]['content'],
                                                  style: TextStyle(
                                                      color:
                                                          theme.darkTextColor,
                                                      fontSize:
                                                          screenWidth * 3.1,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0,
                                            screenWidth * 5, screenWidth * 3),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showOptionsBlock = false;
                                              showDescriptionBlock = true;
                                            });
                                          },
                                          child: Container(
                                            height: screenWidth * 12,
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      screenWidth * 50),
                                              boxShadow: theme.boxShadow,
                                            ),
                                            child: Text(
                                              'Weiter',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: theme.whiteColor,
                                                  fontSize: screenWidth * 4,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  !showDescriptionBlock
                      ? SizedBox()
                      : BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Center(
                              child: Container(
                                height: screenWidth * 80,
                                width: screenWidth * 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        theme.lightTextColor.withOpacity(.8)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            showDescriptionBlock = false;
                                          });
                                        },
                                        child: Container(
                                          height: screenWidth * 8,
                                          width: screenWidth * 8,
                                          decoration: BoxDecoration(
                                              color: theme.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Icon(
                                            Icons.close,
                                            size: screenWidth * 4,
                                            color: theme.mainColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenWidth * 4,
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 10, 5, 5),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 2),
                                      decoration: BoxDecoration(
                                          color: theme.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                        controller: description,
                                        maxLines: 11,
                                        maxLength: 1000,
                                        style: TextStyle(
                                          color: theme.darkTextColor,
                                          fontSize: screenWidth * 3.3,
                                        ),
                                        decoration: InputDecoration(
                                          counterText: '',
                                          contentPadding: EdgeInsets.only(
                                              left: screenWidth * 4),
                                          border: InputBorder.none,
                                          hintText:
                                              'Bitte beschreibe das Problem ...',
                                          hintStyle: TextStyle(
                                            color: theme.lightTextColor,
                                            fontSize: screenWidth * 3.3,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 3, 5, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          '${1000 - description.text.length} signs left',
                                          style: TextStyle(
                                              color: theme.darkTextColor
                                                  .withOpacity(.9),
                                              fontSize: screenWidth * 2.8,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          screenWidth * 5,
                                          0,
                                          screenWidth * 5,
                                          screenWidth * 3),
                                      child: GestureDetector(
                                        onTap: () {
                                          // Navigator.of(context).push(MaterialPageRoute(
                                          //     builder: (context) => Registration()));
                                          setState(() {
                                            showDescriptionBlock = false;
                                            showCongratsBlock = true;
                                            Future.delayed(Duration(seconds: 2))
                                                .then((value) {
                                              setState(() {
                                                showCongratsBlock = false;
                                              });
                                            });
                                          });
                                        },
                                        child: Container(
                                          height: screenWidth * 12,
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(
                                                screenWidth * 50),
                                            boxShadow: theme.boxShadow,
                                          ),
                                          child: Text(
                                            'Abschicken',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: theme.whiteColor,
                                                fontSize: screenWidth * 4,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                  !showCongratsBlock
                      ? SizedBox()
                      : BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                          child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: Center(
                                child: Container(
                                  height: screenWidth * 50,
                                  width: screenWidth * 80,
                                  padding: EdgeInsets.all(screenWidth * 6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: theme.whiteColor),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/congrats_icon.png',
                                        height: screenWidth * 30,
                                        width: screenWidth * 30,
                                      ),
                                      Text(
                                        'Danke, dass du uns bei der Optimierung der Webseite unterstützt',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: theme.darkTextColor
                                                .withOpacity(.9),
                                            fontSize: screenWidth * 3.3,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              )))
                ],
              ),
            )));
  }

  AppBar appBar(context, screenWidth) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          margin: EdgeInsets.all(screenWidth * 3),
          decoration: BoxDecoration(
              color: theme.whiteColor, borderRadius: BorderRadius.circular(5)),
          child: Icon(
            Icons.close,
            size: screenWidth * 4,
            color: theme.mainColor,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            setState(() {
              showOptionsBlock = true;
            });
          },
          child: Container(
              margin: EdgeInsets.all(screenWidth * 3),
              padding: EdgeInsets.all(screenWidth * 1.5),
              decoration: BoxDecoration(
                  color: theme.whiteColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Image.asset('assets/question_icon.png')),
        )
      ],
    );
  }
}
