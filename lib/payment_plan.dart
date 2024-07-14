import 'package:flutter/material.dart';

List paymentList = [
  {
    'plan': 'Free Plan',
    'property': '1 Property Apply',
    'rupees': '0.00/',
    'time': '1 Day(s)',
    'verifid': false
  },
  {
    'plan': 'Basic Plan',
    'property': '5 Property Apply',
    'rupees': '10.00/',
    'time': '7 Day(s)',
    'verifid': false
  },
  {
    'plan': 'Primium Plan',
    'property': '1 Property Apply',
    'rupees': '50.00/',
    'time': '1 Month(s)',
    'verifid': false
  },
  {
    'plan': 'Platinum Plan',
    'property': '1 Property Apply',
    'rupees': '95.00/',
    'time': '1 Year(s)',
    'verifid': false
  },
];

class PaymentPlanPage extends StatefulWidget {
  const PaymentPlanPage({super.key});

  @override
  State<PaymentPlanPage> createState() => _PaymentPlanPageState();
}

class _PaymentPlanPageState extends State<PaymentPlanPage> {

  int selectes = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                    child: Icon(Icons.cancel, size: 30, color: Colors.brown,)
                ),
              ),

              SizedBox(height: 20,),
              Text('Subscription Plan', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),

              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('User can upload properties based on plan. choose plan based on usage, below there are plan name'
                    ', price, property limit and validity days.', style: TextStyle(fontSize: 16),),
              ),

              SizedBox(height: 10,),
              Expanded(
                child: GridView.builder(
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: () {
                        paymentList[0]['verifid']=false;
                        paymentList[1]['verifid']=false;
                        paymentList[2]['verifid']=false;
                        paymentList[3]['verifid']=false;
                        paymentList[index]['verifid']=true;
                        setState(() {

                        });
                      },
                      child: Container(
                        // height: 100,
                        // margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: paymentList[index]['verifid']==true? Colors.brown: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(-1, 2))]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.grey, size: 30,),

                                  SizedBox(width: 15,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(paymentList[index]['plan'], style: TextStyle(fontSize: 18, color: paymentList[index]['verifid']==true? Colors.white:Colors.black, fontWeight: FontWeight.bold)),
                                      SizedBox(height: 10,),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.brown.shade50,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child:
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                                            child: Text(paymentList[index]['property'], style: TextStyle(color: Colors.brown, fontSize: 16, fontWeight: FontWeight.bold)),
                                          )
                                      ),
                                    ],
                                  ),

                                  Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Text(paymentList[index]['rupees'], style: TextStyle(color: paymentList[index]['verifid']==true? Colors.white:Colors.brown, fontSize: 20, fontWeight: FontWeight.bold),),
                                          Text('Rs', style: TextStyle(color: Colors.brown, fontSize: 20),),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Text(paymentList[index]['time'], style: TextStyle(color: paymentList[index]['verifid']==true? Colors.white: Colors.brown, fontWeight: FontWeight.w400, fontSize: 16),),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: paymentList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 100,
                    mainAxisSpacing: 10
                  ),
                ),
              ),

              SizedBox(height: 20,),
              SizedBox(
                height: 56,
                width: 380,
                child: ElevatedButton(onPressed: () {

                }, child: Text('Select Plan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.brown),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
