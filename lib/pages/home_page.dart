import 'package:calculator_pr/colors/color.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  var input = '';
  var output = '';
  bool isShow = false;
  var opsize = 35.0;
  bool isLight = false;
  IconData _iconbright = Icons.wb_sunny;
  IconData _icondark = Icons.nights_stay;
  onclick(t) {
    // print(t);
    if (t == 'C') {
      input = '';
      output = '';
    } else if (t == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (t == '=') {
      if (input.isNotEmpty) {
        var userip = input;
        userip = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression exp = p.parse(userip);
        ContextModel cm = ContextModel();
        var final_value = exp.evaluate(EvaluationType.REAL, cm);
        output = final_value.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        isShow = true;
        opsize = 50.0;
      }
    } else {
      input = input + t;
      isShow = false;
      opsize = 35.0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            isLight ? LightColors.appbarcolor : Darkcolors.appbarcolor,
        title: Text(
          'Calculator',
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isLight = !isLight;
              });
            },
            icon: Icon(
              isLight ? _icondark : _iconbright,
            ),
          )
        ],
      ),
      backgroundColor: isLight ? LightColors.bgrColor : Darkcolors.bgrColor,
      body: Column(
        children: [
          Expanded(
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        isShow ? '' : input,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 45,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: isLight
                              ? LightColors.txtColor
                              : Darkcolors.txtColor,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        output,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: opsize,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: isLight
                              ? LightColors.txtColor
                              : Darkcolors.txtColor,
                        ),
                      )
                    ],
                  ))),
          Row(
            children: [
              button(
                T: 'C',
                Tcolor: isLight
                    ? LightColors.operatorcolor
                    : Darkcolors.operatorColor,
              ),
              button(
                T: '%',
                Tcolor: isLight
                    ? LightColors.operatorcolor
                    : Darkcolors.operatorColor,
              ),
              button(
                T: '<',
                Tcolor: isLight
                    ? LightColors.operatorcolor
                    : Darkcolors.operatorColor,
              ),
              button(
                T: '/',
                Tcolor: isLight
                    ? LightColors.operatorcolor
                    : Darkcolors.operatorColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                T: '7',
                Tcolor: isLight ? LightColors.txtColor : Darkcolors.txtColor,
              ),
              button(
                T: '8',
                Tcolor: isLight ? LightColors.txtColor : Darkcolors.txtColor,
              ),
              button(
                T: '9',
                Tcolor: isLight ? LightColors.txtColor : Darkcolors.txtColor,
              ),
              button(
                T: 'x',
                Tcolor: isLight
                    ? LightColors.operatorcolor
                    : Darkcolors.operatorColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                T: '4',
                Tcolor: isLight ? LightColors.txtColor : Darkcolors.txtColor,
              ),
              button(
                T: '5',
                Tcolor: isLight ? LightColors.txtColor : Darkcolors.txtColor,
              ),
              button(
                T: '6',
                Tcolor: isLight ? LightColors.txtColor : Darkcolors.txtColor,
              ),
              button(
                T: '-',
                Tcolor: isLight
                    ? LightColors.operatorcolor
                    : Darkcolors.operatorColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                T: '1',
                Tcolor: isLight ? LightColors.txtColor : Darkcolors.txtColor,
              ),
              button(
                T: '2',
                Tcolor: isLight ? LightColors.txtColor : Darkcolors.txtColor,
              ),
              button(
                T: '3',
                Tcolor: isLight ? LightColors.txtColor : Darkcolors.txtColor,
              ),
              button(
                T: '+',
                Tcolor: isLight
                    ? LightColors.operatorcolor
                    : Darkcolors.operatorColor,
              ),
            ],
          ),
          Row(
            children: [
              button(
                T: '00',
                Tcolor: isLight ? LightColors.txtColor : Darkcolors.txtColor,
              ),
              button(
                T: '0',
                Tcolor: isLight ? LightColors.txtColor : Darkcolors.txtColor,
              ),
              button(
                T: '.',
                Tcolor: isLight ? LightColors.txtColor : Darkcolors.txtColor,
              ),
              button(
                T: '=',
                Tcolor: isLight
                    ? LightColors.operatorcolor
                    : Darkcolors.operatorColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({T, Tcolor = Colors.white, backgrndcolor = Colors.black}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () => onclick(T),
          child: Text(
            T!,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 25,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              color: Tcolor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(25),
            backgroundColor:
                isLight ? LightColors.bttnbgcolor : Darkcolors.bttnbgcolor,
          ),
        ),
      ),
    );
  }
}
