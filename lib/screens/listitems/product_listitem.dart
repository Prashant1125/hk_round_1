import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hackerkernel/models/product.dart';
import 'package:hackerkernel/screens/homepage.dart';

class ProductListItem extends StatefulWidget {
  final Product product;
  const ProductListItem({super.key, required this.product});

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.sizeOf(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        width: mq.width * .443,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.file(
                      File(
                        widget.product.image,
                      ),
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                      onPressed: () {
                        products.remove(widget.product);
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.productName,
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text("\$${widget.product.price}.00",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
