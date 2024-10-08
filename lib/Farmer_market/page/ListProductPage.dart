
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ListProductPage extends StatefulWidget {
  @override
  _ListProductPageState createState() => _ListProductPageState();
}

class _ListProductPageState extends State<ListProductPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  File? _selectedImage; // To store the selected image
  final ImagePicker _picker = ImagePicker();

  // Method to pick image from gallery
  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path); // Store the image file
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List a Product'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Product name input
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                // Price input
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // Image picker section
                _selectedImage != null
                    ? Container(
                  constraints: BoxConstraints(
                    maxHeight: 150, // Set a max height for the image
                  ),
                  child: Image.file(
                    _selectedImage!,
                    fit: BoxFit.cover,
                  ),
                )
                    : Text('No image selected'),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Pick an Image'),
                ),
                SizedBox(height: 20),
                // Submit product
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_selectedImage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please select an image'))
                        );
                      } else {
                        // Gather the product details and selected image
                        Map<String, dynamic> newProduct = {
                          'name': _nameController.text,
                          'price': _priceController.text,
                          'image': _selectedImage!.path, // Pass the image path
                        };

                        // Pass the product details back to HomeScreen
                        Navigator.pop(context, newProduct);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                  ),
                  child: Text('Submit Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
