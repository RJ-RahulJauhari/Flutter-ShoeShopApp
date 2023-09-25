
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget{
  final String title;
  final double price;
  final String image;
  final Color bgColor;

  const ProductCard({super.key,required this.title, required this.price, required this.image, required this.bgColor});

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20)
      ),
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('\$$price', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Image(
                image: AssetImage(image),
                height: 175,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}