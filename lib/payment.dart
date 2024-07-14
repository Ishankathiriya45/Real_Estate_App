import 'package:estate/payment_plan.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Container(
        //     alignment: Alignment.center,
        //     decoration: BoxDecoration(
        //         color: Colors.white,
        //         shape: BoxShape.circle
        //     ),
        //     margin: EdgeInsets.all(8),
        //     child: Icon(Icons.arrow_back_ios_rounded, size: 30, color: Colors.brown,),
        //   ),
        // ),
        automaticallyImplyLeading: true,
        title: Text('My Subscription', style: TextStyle(color: Colors.white, fontSize: 20),),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 160,
              width: double.infinity,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Colors.brown.shade50,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('My Subscription', style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 60, right: 18, left: 18),
            child: Container(
              height: 114,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Please select subscription plan', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),),

                    SizedBox(height: 16,),
                    SizedBox(
                      height: 50,
                      width: 280,
                      child: ElevatedButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPlanPage(),));
                      }, child: Text('Buy Plan', style: TextStyle(fontSize: 20),),
                        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.brown),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
