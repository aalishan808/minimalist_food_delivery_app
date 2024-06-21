import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';
class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});
  TextEditingController addressController = TextEditingController();
void openLocationSearchBox(BuildContext context){
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: const Text("Your Location"),
          content: TextField(
            controller: addressController,
            decoration: InputDecoration(
              hintText: "Enter address.."
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                addressController.clear();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                String newAddress = addressController.text;
                context.read<Restaurant>().updateDeliveryAddress(newAddress);
                Navigator.pop(context);
                addressController.clear();

              },
              child: const Text("Save"),
            ),
          ],
        ),
    );
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text("Deliver Now ",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary
          ),),
          GestureDetector(
            onTap:()=> openLocationSearchBox(context),
            child: Row(
              children: [
                //address
              Consumer<Restaurant>(builder:(context,restaurant,child){
                return Text(restaurant.deliveryAddress,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold
                ),);
              })
              ,

                //drop down menu
                 Icon(Icons.keyboard_arrow_down_rounded,
                color: Theme.of(context).colorScheme.inversePrimary,),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
