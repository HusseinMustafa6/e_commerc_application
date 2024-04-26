


import 'dart:io';

import 'package:e_commerce/modules/add_product/add_product_controller.dart';
import 'package:e_commerce/modules/myhome_page/myhome_page.dart';
import 'package:e_commerce/modules/myhome_page/user_profile/user_profile.dart';
import 'package:e_commerce/modules/update_product/update_product_controller.dart';
import 'package:e_commerce/my_widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

List <DropdownMenuItem<String>> availableCategoriesItems = [
  DropdownMenuItem<String>(
    value: availableCategories[0],
    child: Text(availableCategories[0]!, style: TextStyle(fontSize: 20),),
  ),
  DropdownMenuItem<String>(
    value: availableCategories[1],
    child: Text(availableCategories[1]!, style: TextStyle(fontSize: 20),),
  ),
  DropdownMenuItem<String>(
    value: availableCategories[2],
    child: Text(availableCategories[2]!, style: TextStyle(fontSize: 20),),
  ),
  DropdownMenuItem<String>(
    value: availableCategories[3],
    child: Text(availableCategories[3]!, style: TextStyle(fontSize: 20),),
  ),
  DropdownMenuItem<String>(
    value: availableCategories[4],
    child: Text(availableCategories[4]!, style: TextStyle(fontSize: 20),),
  ),
  DropdownMenuItem<String>(
    value: availableCategories[5],
    child: Text(availableCategories[5]!, style: TextStyle(fontSize: 20),),
  ),
  DropdownMenuItem<String>(
    value: availableCategories[6],
    child: Text(availableCategories[6]!, style: TextStyle(fontSize: 20),),
  ),
  DropdownMenuItem<String>(
    value: availableCategories[7],
    child: Text(availableCategories[7]!, style: TextStyle(fontSize: 20),),
  ),
  DropdownMenuItem<String>(
    value: availableCategories[8],
    child: Text(availableCategories[8]!, style: TextStyle(fontSize: 20),),
  ),
  DropdownMenuItem<String>(
    value: availableCategories[9],
    child: Text(availableCategories[9]!, style: TextStyle(fontSize: 20),),
  ),
  DropdownMenuItem<String>(
    value: availableCategories[10],
    child: Text(availableCategories[10]!, style: TextStyle(fontSize: 20),),
  ),
  DropdownMenuItem<String>(
    value: availableCategories[11],
    child: Text(availableCategories[11]!, style: TextStyle(fontSize: 20),),
  ),
  DropdownMenuItem<String>(
    value: availableCategories[12],
    child: Text(availableCategories[12]!, style: TextStyle(fontSize: 20),),
  ),
  DropdownMenuItem<String>(
    value: availableCategories[13],
    child: Text(availableCategories[13]!, style: TextStyle(fontSize: 20),),
  ),

];

UpdateProductController updateProductController = Get.put(UpdateProductController());

class UpdateProduct extends StatefulWidget {
  Product updateProduct;

  UpdateProduct(this.updateProduct);

  @override
  _UpdateProductState createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? selectedCategory;
  File? image;



  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
          source: source); //selected image will be stored here
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade200,
                Colors.lightBlue.shade100,
                Colors.purple.shade100,
                Colors.purple.shade200
              ],
            )),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60,),
                Row(
                  children: [
                    Icon(Icons.edit,color: Colors.black,),
                    SizedBox(width: 8,),
                    Expanded(
                      child: Text('here you can change the selected product info , change only the fields that you want not all the fields are required.',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700 ,color: Colors.black54),maxLines: 3,),
                    ),
                  ],
                ),
                TextField(
                  onChanged: (value) {
                    if(value.isNotEmpty) {
                      widget.updateProduct.productName = value;
                      updateProductController.productName =value;
                    }else{
                      updateProductController.productName = null;
                    }
                  },
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45, width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: "Edit Product Name",
                      labelStyle: TextStyle(fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)


                  ),
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,

                ),
                SizedBox(height: 20,),
                TextField(
                  maxLines: 3,
                  onChanged: (value) {
                    if(value.isNotEmpty){
                      widget.updateProduct.productDescription = value;
                      updateProductController.productDescription = value;
                    }else{
                      updateProductController.productDescription = null;
                    }
                  },
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45, width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: "Description",
                      labelStyle: TextStyle(fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)


                  ),
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,

                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          if(value.isNotEmpty){
                            widget.updateProduct.productPrice = value;
                            updateProductController.productPrice = value;
                          }else{
                            updateProductController.productPrice = null;
                          }
                        },
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45,
                                    width: 2),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            labelText: "Price",
                            labelStyle: TextStyle(fontSize: 18,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)


                        ),
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.number,

                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black45,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(10)
                              )),
                          hint: Text('Category', style: TextStyle(fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),),
                          onChanged: (item) {
                            setState(() {
                              selectedCategory = item;
                              if(widget.updateProduct.productCategory!=selectedCategory){
                                widget.updateProduct.productCategory =selectedCategory;
                                updateProductController.productCategory = selectedCategory;
                              }else{
                                updateProductController.productCategory = null;
                              }
                            });
                          },
                          value: selectedCategory,
                          items: availableCategoriesItems,
                        )),
                  ],
                ),
                SizedBox(height: 20,),
                TextField(
                  onChanged: (value) {
                    if(value.isNotEmpty) {
                      widget.updateProduct.productQuantity = value;
                      updateProductController.productQuantity = value;
                    }else{
                      updateProductController.productQuantity =null;
                    }
                  },
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45,
                              width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: "Quantity",
                      labelStyle: TextStyle(fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)


                  ),
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,

                ),
                SizedBox(height: 20,),
                Text('Product Image', style: TextStyle(fontSize: 22,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(onPressed: ()async{
                       await pickImage(ImageSource.gallery);
                        setState(() {
                          if(image!=null) {
                            widget.updateProduct.imageLink = image;
                            updateProductController.imageLink = image;
                          }else{
                            updateProductController.imageLink =null;
                          }
                        });
                      },
                          color: Colors.greenAccent,
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.3,
                            child: Row(
                              children: [
                                Icon(Icons.photo),
                                SizedBox(width: 10,),
                                Text('Pick gallery', style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),)
                              ],
                            ),
                          )
                      ),
                    ),
                    SizedBox(width: 30,),
                    Expanded(
                      child: FlatButton(onPressed: () async{
                        await  pickImage(ImageSource.camera);
                        setState(() {

                            if(image!=null) {
                              widget.updateProduct.imageLink = image;
                              updateProductController.imageLink = image;
                            }else{
                              updateProductController.imageLink = null;
                            }
                        });

                      },
                          color: Colors.greenAccent,
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.3,
                            child: Row(
                              children: [
                                Icon(Icons.camera),
                                SizedBox(width: 10,),
                                Text('Pick camera', style: TextStyle(fontSize: 14,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),)
                              ],
                            ),
                          )
                      ),
                    ),

                  ],

                ),
                image != null
                    ? Image.file(image!, width: 160, height: 160,)
                    : Text(''),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(child: CustomButton(
                      onPressed: () async {
                        EasyLoading.show(status: 'Loading...',dismissOnTap: true);
                             bool updateStatus = await updateProductController.updateProduct(widget.updateProduct);
                       if(updateStatus) {
                         EasyLoading.showSuccess('Product Updated',duration: Duration(seconds: 3));

                         MyHomePage.currentIndex.value = 3;
                         Get.offAllNamed('/home');
                       }else{

                       }

                      },
                      buttonText: 'Update',
                      buttonColor: Colors.blue[300],
                    )),
                    SizedBox(width: 50,),
                    Expanded(child: CustomButton(
                      onPressed: () {
                        MyHomePage.currentIndex.value = 3;
                        Get.offAllNamed('/home');
                      },
                      buttonText: 'Cancel',
                      buttonColor: Colors.purple[300],
                    ))
                  ],
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}



