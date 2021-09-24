import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesHeader extends StatelessWidget {
  const MoviesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 196,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: Get.width,
            child: Image.asset(
              'assets/images/header.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: Get.width * 0.9,
            padding: EdgeInsets.only(bottom: 20),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Procurar Filmes',
                  prefixIcon: Icon(Icons.search),
                  labelStyle: TextStyle(fontSize: 15, color: Colors.grey),
                  contentPadding: EdgeInsets.zero,
                  //tira a animação do label para cima do texfield
                  floatingLabelBehavior: FloatingLabelBehavior.never),
            ),
          ),
        ],
      ),
    );
  }
}
