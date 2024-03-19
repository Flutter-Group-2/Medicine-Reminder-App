import 'package:flutter/material.dart';

class AddMedicationPage extends StatelessWidget {
  const AddMedicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
       leading:  IconButton(onPressed: (){}, icon:Icon( Icons.arrow_forward)),
      ),
    );
  }
}