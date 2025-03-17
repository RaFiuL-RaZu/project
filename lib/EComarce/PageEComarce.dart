import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project1/EComarce/Model/product.dart' show ProductModel;
import 'package:project1/EComarce/product_controller.dart'
    show ProductController;

class EcomarcePage extends StatefulWidget {
  const EcomarcePage({super.key});

  @override
  State<EcomarcePage> createState() => _EcomarcePageState();
}

class _EcomarcePageState extends State<EcomarcePage> {
  String searchdata = "";

  bool isDataLoading = false;
  List<ProductModel> finalproductList = []; 
  List<ProductModel> productList = [];

  fetchProduct() async {
    isDataLoading = true;
    finalproductList = await ProductController.getProduct();
    log("=${finalproductList.length}===");
    productList = finalproductList;
    isDataLoading = false;
    setState(() {});
  }

  serchFun({required String searchValue}) {
    productList =
        finalproductList
            .where((v) => v.name!.toLowerCase().contains(searchValue))
            .toList();
    setState(() {});
  }

  @override
  void initState() {
    fetchProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello RaFi",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Good Morning!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            TextField(
              onChanged: (value) {
                if (value != " ") {
                  serchFun(searchValue: value);
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 0,
                ),
                prefixIcon: Icon(Icons.search),
                hintText: "Search here..",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  OutlinedButton(onPressed: () {}, child: Text("All")),
                  SizedBox(width: 10),
                  OutlinedButton(onPressed: () {}, child: Text("Polo tShirt")),
                  SizedBox(width: 10),
                  OutlinedButton(onPressed: () {}, child: Text("Cotton")),
                  SizedBox(width: 10),
                  OutlinedButton(onPressed: () {}, child: Text("Local tshirt")),
                  SizedBox(width: 10),
                  OutlinedButton(onPressed: () {}, child: Text("Lotto")),
                  SizedBox(width: 10),
                  OutlinedButton(onPressed: () {}, child: Text("Appex")),
                ],
              ),
            ),
            isDataLoading == true
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .65,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        child: SizedBox(
                          height: 250,
                          width: MediaQuery.sizeOf(context).width / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: FadeInImage(
                                  placeholder: NetworkImage(
                                    "https://cdn.pixabay.com/animation/2023/03/15/17/17/17-17-42-929_512.gif",
                                  ),
                                  image: NetworkImage(
                                    "${productList[index].image}",
                                  ),
                                  imageErrorBuilder: (context, i, j) {
                                    return Center(
                                      child: Image.network(
                                        "https://static.thenounproject.com/png/504708-200.png",
                                      ),
                                    );
                                  },
                                ),
                                // child: Container(
                                //   height: 150,
                                //   width: MediaQuery.sizeOf(context).width,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.only(
                                //       topLeft: Radius.circular(10),
                                //       topRight: Radius.circular(10),
                                //     ),
                                //     color: Colors.grey,
                                //   ),
                                //   child: Image.network("${productList[index].image}",fit: BoxFit.fill,),
                                // ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      maxLines: 1,
                                      "${productList[index].name}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 2,
                                      ),
                                      child: Text(
                                        "Regular price :${productList[index].regularPrice}0",
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Offer:${productList[index].offerPrice}0",
                                        ),
                                        SizedBox(width: 15),
                                        Text("(15%)"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
