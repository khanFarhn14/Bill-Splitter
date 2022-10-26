import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';

class BillSplitter extends StatefulWidget {
  const BillSplitter({Key? key}) : super(key: key);

  @override
  State<BillSplitter> createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> 
{
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: Container
      (
        color: const Color(0xffE0E0E0),
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        child: ListView
        (
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20.5),
          children: 
          [
            //Total Per Person Container
            Container
            (
              width: 150,
              height: 250,
              

              //Adding Personal touch
              decoration: ShapeDecoration
              (
                color: const Color(0xffA48ADB).withOpacity(0.2),
                shape: SmoothRectangleBorder
                (
                  borderRadius: SmoothBorderRadius
                  (
                    cornerRadius: 20,
                    cornerSmoothing: 0.9,
                  ),
                ),
              ),

              child: Center(
                child: Column
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    const Text
                    (
                      "Total Per Person",
                      style: TextStyle
                      (
                        fontFamily: 'soraLight',
                        fontSize: 23.0,
                        color: Color(0xff6535CC),
                        letterSpacing: 2.4,
                      )
                    ),

                    const SizedBox(height: 10),

                    //Number
                    Text
                    (
                      "\u{20B9}${clclteTtlPerPersn(_billAmount, _personCounter, _tipPercentage)}",//For Indian currency
                      style: const TextStyle
                      (
                        fontFamily: 'consolaBold',
                        fontSize: 33.0,
                        color: Color(0xff6535CC)
                      )
                    )
                  ],  
                ) ,
              )
            ),


            //Bill Amount and all
            Container
            (
              //Setting of the Container
              height: 250,
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration
              (
                border: Border.all
                (
                  color: const Color(0xffAEAEAE),
                ),
                borderRadius: BorderRadius.circular(12.0)
              ),

              
              child: Column
              (
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                [
                  //TextInput
                  TextField
                  (
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),//decimal: true because so that we can invoke or add decimal numbers
                    style: const TextStyle
                    (
                      color: Color(0xff6535CC),
                    ),
                    decoration: InputDecoration
                    (
                      // prefixText: '+200',
                      label: const Text("Bill Amount "),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // border: InputBorder.none, //this will disable border
                    ),
                    onChanged: (String price)
                    {
                      try
                      {
                        setState(() {
                          _billAmount = double.parse(price);
                        });
                      }catch(exception)
                      {
                        _billAmount = 0.0;
                      }
                    },
                  ),

                  //Split
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      Text(
                        "split",
                        style: nrmlText(),
                      ),

                      Row
                      (
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: 
                        [
                          InkWell
                          (
                            onTap: () 
                            {
                              setState
                              ( () 
                                {
                                  if(_personCounter > 1)
                                  {
                                    _personCounter--;
                                  }else{
                                    //do nothing
                                  }
                                }
                              );
                            },
                            child: Container
                            (
                              width: 35,
                              height: 35,
                              decoration: ShapeDecoration
                              (
                                color: const Color(0xffA48ADB).withOpacity(0.2),
                                shape: SmoothRectangleBorder
                                (
                                  borderRadius: SmoothBorderRadius
                                  (
                                    cornerRadius: 8,
                                    cornerSmoothing: 0.9,
                                  ),
                                ),
                              ),
                              child: const Center
                              (
                                child: Text
                                (
                                  "-",
                                  style: TextStyle
                                  (
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30
                                  )
                                )
                              )
                            )
                          ),

                          const SizedBox(width: 10,),

                          Text
                          (
                            "$_personCounter",
                            style: const TextStyle
                            (
                              fontFamily: 'consolaBold',
                              fontSize: 20,
                            ),
                          ),

                          const SizedBox(width: 10,),

                          InkWell
                          (
                            onTap: () 
                            {
                              setState
                              ( () 
                                {
                                  _personCounter++;
                                }
                              );
                            },
                            child: Container
                            (
                              width: 35,
                              height: 35,
                              decoration: ShapeDecoration
                              (
                                color: const Color(0xffA48ADB).withOpacity(0.2),
                                shape: SmoothRectangleBorder
                                (
                                  borderRadius: SmoothBorderRadius
                                  (
                                    cornerRadius: 8,
                                    cornerSmoothing: 0.9,
                                  ),
                                ),
                              ),
                              child: const Center
                              (
                                child: Text
                                (
                                  "+",
                                  style: TextStyle
                                  (
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 30
                                  )
                                )
                              )
                            )
                          ),
                        ],
                      )
                    ],
                  ),

                  //Tip
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      Text
                      (
                        "Tip",
                        style: nrmlText(),
                      ),

                      Padding
                      (
                        padding: const EdgeInsets.fromLTRB(40,0,40,0),
                        child: Text
                        (
                          "\u{20B9}${clclteTip(_billAmount, _tipPercentage)}",
                          style: const TextStyle
                          (
                            fontFamily: 'consolaBold',
                            fontSize: 20.0,
                            color: Color(0xff6535CC)
                          ) 
                        ),
                      )
                    ],
                  ),

                  //Slider
                  Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: 
                    [
                      Text
                      (
                        "$_tipPercentage%",
                        style: const TextStyle
                        (
                          fontFamily: 'consolaBold',
                          fontSize: 15.0,
                          color: Color(0xff6535CC)
                        ),
                      ),

                      //Slider
                      Slider
                      (
                        min: 0,
                        max: 100,
                        activeColor: const Color(0xff6535CC),
                        inactiveColor: const Color(0xff6535CC).withOpacity(0.5),
                        divisions: 10,
                        value: _tipPercentage.toDouble(),
                        onChanged: (double newValue)
                        {
                          setState
                          (() 
                            {
                              _tipPercentage = newValue.round();//It works like this 12.4343 round is 12
                            }
                          );
                        }
                      )

                    ],
                  )
                ],
              )


            )

          ],//Children of ListView

        )

      ),

    );

  }//Widget build(BuildContext context)

  TextStyle nrmlText()
  {
    return const TextStyle
    (
      fontFamily: 'soraLight',
      fontSize: 15,
      color: Colors.black,
      letterSpacing: 2,
    );
  }

  clclteTip(double billAmount, int percentage)
  {
    double clclteTip = 0.0;
    if(billAmount < 0 || billAmount.toString().isEmpty)
    {
      //Do nothing
    }else{
      clclteTip = (billAmount/100)*percentage;
    }
    return double.parse(clclteTip.toStringAsFixed(2));//I overcome this problem
  }

  clclteTtlPerPersn(double billAmount, int split, int percentage)
  {
    double ttlPrPrsn = 0.0;
    ttlPrPrsn = billAmount / split + clclteTip(billAmount, percentage);
    return ttlPrPrsn.toStringAsFixed(2);
  }

}//class _BillSplitterState extends State<BillSplitter> 