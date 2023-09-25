import "package:flutter/material.dart";
import '../widgets/ProductCard.dart';
import 'ProductDetailsPage.dart';
import '../global_variables.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = ['All', 'Adidas', 'Nike', 'Bata'];
  late String selected_filter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected_filter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    const border = OutlineInputBorder(
        borderSide:
            BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(50)));

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Shoes\nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border),
                ),
              )
            ],
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected_filter = filters[index];
                      });
                    },
                    child: Chip(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1)),
                      backgroundColor: selected_filter == filters[index]
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      label: Text(filters[index]),
                      labelStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              child: size.width > 650 ?
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ProductDetailsPage(product: product);
                        }));
                      },
                      child: ProductCard(
                        title: product['title'] as String,
                        price: product['price'] as double,
                        image: product['imageUrl'] as String,
                        bgColor: index % 2 == 0
                            ? const Color.fromRGBO(216, 240, 253, 1)
                            : const Color.fromRGBO(245, 247, 249, 1),
                      ),
                    );
                  },
                  itemCount: products.length):
          ListView.builder(
            itemBuilder: (context,index) {
              final product = products[index];
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return ProductDetailsPage(product: product);
                  }));
                },
                child: ProductCard(
                  title: product['title'] as String,
                  price: product['price'] as double,
                  image: product['imageUrl'] as String,
                  bgColor: index % 2 == 0 ?
                  const Color.fromRGBO(216, 240, 253, 1):
                  const Color.fromRGBO(245, 247, 249, 1)
                  ,
                ),
              );
            },
            itemCount: products.length,
          )
          )
        ],
      ),
    );
  }
}
