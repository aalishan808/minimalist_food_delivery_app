import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  void userTappdPay(){
    if(formKey.currentState!.validate()){
      showDialog(
          context: context,
          builder: (context)=>AlertDialog(
        title: Text("Confirm Payment",style: TextStyle(color:Theme.of(context).colorScheme.inversePrimary),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text("Card number: $cardNumber", style: TextStyle(color:Theme.of(context).colorScheme.primary),),
              Text("Expiry date: $expiryDate",style: TextStyle(color:Theme.of(context).colorScheme.primary),),
              Text("Card holder: $cardHolderName",style: TextStyle(color:Theme.of(context).colorScheme.primary),),
              Text("CVV: $cvvCode",style: TextStyle(color:Theme.of(context).colorScheme.primary),),
            ],
          ),
        ),
        actions: [
          //cancel button
          TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          //yes button
          TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const DeliveryProgressPage()));

              },
            child:  const Text("Yes"),
          ),
        ],
      ));
    }else{
      print("invalid");
    }
  }
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
      ),
      body: Column(
        children: [
          //credit card
      CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (p0){}
      ),
          //credit card form
          CreditCardForm(
            formKey: formKey ,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            cardNumber: cardNumber,
            onCreditCardModelChange: (data){
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            },
          ),
          Spacer(),        //pay button
          MyButton(
            onTap: userTappdPay,
            text: "Pay now",),
          SizedBox(height: 25,),

          ],
      ),
    );
  }
}
