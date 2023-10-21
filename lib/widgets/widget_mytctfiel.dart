import 'package:flutter/material.dart';

class MyTxtField extends StatelessWidget {
  const MyTxtField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(

      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          hintText: "eg : Mission Impossible",
          hintStyle: TextStyle(color: Colors.grey.shade500),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.red,
          ),
          suffixIcon: const Icon(
            Icons.close,
            color: Colors.red,
          )),
    );
  }
}
