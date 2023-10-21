import 'package:flutter/material.dart';

class appBar extends StatelessWidget {
  const appBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        children: [
          Text(
            "SHOW ",
            style: TextStyle(color: Colors.red, fontSize: 35),
          ),
          Text(
            "TIME",
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.black,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/1559486/pexels-photo-1559486.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          ),
        )
      ],
    );
  }
}
