// import 'dart:convert';
// import 'dart:async';
// import 'package:scoped_model/scoped_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:rxdart/subjects.dart';
// import 'dart:io';
// import 'package:mime/mime.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:ui_app/models/auth_mode.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import '../models/product.dart';
// import '../models/user.dart';

// /* Connetcted Product model */
// mixin ConnectedProducts on Model {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   List<Product> _products = [];
//   String _productId;
//   User _authUser;
//   bool _isLodaing;
//   String dbLink = 'https://products-74d98.firebaseio.com/products';

//   Future<Map<String, dynamic>> uploadImage(File image,
//       {String imagePath}) async {
//     final mimeTypeData = lookupMimeType(image.path).split('/');
//     final imgUploadReq = http.MultipartRequest(
//         'POST',
//         Uri.parse(
//             'https://us-central1-products-74d98.cloudfunctions.net/storeImage'));
//     final file = await http.MultipartFile.fromPath(
//       'image',
//       image.path,
//       contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
//     );
//     imgUploadReq.files.add(file);
//     if (imagePath != null) {
//       imgUploadReq.fields['imagePath'] = Uri.encodeComponent(imagePath);
//     }
//     imgUploadReq.headers['Authorization'] = 'Bearer ${_authUser.token}';
//     try {
//       final streamResponse = await imgUploadReq.send();
//       final response = await http.Response.fromStream(streamResponse);
//       if (response.statusCode != 200 && response.statusCode != 201) {
//         print('SomeThing went Wrong');
//         print(json.encode(response.body));
//         return null;
//       }
//       final responseData = json.decode(response.body);
//       return responseData;
//     } catch (error) {
//       print(error);
//       return null;
//     }
//   }

//   /* Add Product Function */
//   Future<bool> addProduct(
//       String title, String desc, double price, File image) async {
//     _isLodaing = true;
//     notifyListeners();
//     final uploadData = await uploadImage(image);
//     if (uploadData == null) {
//       print('upload Failed');
//       return false;
//     }
//     final Map<String, dynamic> productData = {
//       'title': title,
//       'desc': desc,
//       'price': price,
//       'imagePath': uploadData['imagePath'],
//       'imageUrl': uploadData['imageUrl'],
//       'userEmail': _authUser.email,
//       'userId': _authUser.id
//     };
//     try {
//       final http.Response response = await http.post(
//           dbLink + '.json?auth=${_authUser.token}',
//           body: json.encode(productData));
//       if (response.statusCode != 200 && response.statusCode != 201) {
//         _isLodaing = false;
//         notifyListeners();
//         return false;
//       }
//       final Map<String, dynamic> responseData = json.decode(response.body);
//       final Product newProduct = Product(
//           id: responseData['name'],
//           title: title,
//           desc: desc,
//           price: price,
//           image: uploadData['imageUrl'],
//           imagePath: uploadData['imagePath'],
//           userEmail: _authUser.email,
//           userId: _authUser.id);
//       _products.add(newProduct);
//       _isLodaing = false;
//       notifyListeners();
//       return true;
//     } catch (error) {
//       _isLodaing = false;
//       notifyListeners();
//       return true;
//     }
//   }
// }

// /* Product Model */

// mixin ProductModel on ConnectedProducts {
//   bool _showFav = false;
// /*Return All Product*/

//   List<Product> get allProducts {
//     return List.from(_products);
//   }

//   /*Filterded Product if is Favorite or not */
//   List<Product> get productsMode {
//     if (_showFav) {
//       return _products.where((Product product) => product.isFav).toList();
//     }
//     notifyListeners();
//     return List.from(_products);
//   }

//   int get selectedProductIndex {
//     return _products.indexWhere((Product product) {
//       return product.id == _productId;
//     });
//   }

//   /* get the product Index Globaly */
//   String get selectedProductId {
//     return _productId;
//   }

//   /* Get The Selected Product Globaly */
//   Product get selectedProduct {
//     if (selectedProductId == null) {
//       return null;
//     }
//     return _products.firstWhere((Product product) {
//       return product.id == _productId;
//     });
//   }

//   /* get is Fav Value true Or False */
//   bool get displayFavonly {
//     return _showFav;
//   }

//   /* Get All Products From Db */

//   Future<Null> fetchData({onlyForUser: false}) {
//     _isLodaing = true;
//     notifyListeners();

//     return http.get(dbLink + '.json?auth=${_authUser.token}').then<Null>(
//       (http.Response response) {
//         final List<Product> fetchedList = [];
//         final Map<String, dynamic> listOfData = json.decode(response.body);
//         if (listOfData == null) {
//           _isLodaing = false;
//           notifyListeners();
//           return;
//         }
//         listOfData.forEach((String key, dynamic listData) {
//           final Product product = Product(
//               id: key,
//               title: listData['title'],
//               desc: listData['desc'],
//               price: listData['price'],
//               image: listData['imageUrl'],
//               imagePath: listData['imagePath'],
//               userEmail: listData['userEmail'],
//               userId: listData['userId'],
//               isFav: listData['wishlistUser'] == null
//                   ? false
//                   : (listData['wishlistUser'] as Map<String, dynamic>)
//                       .containsKey(_authUser.id));
//           fetchedList.add(product);
//         });
//         _products = onlyForUser
//             ? fetchedList.where((Product product) {
//                 return product.userId == _authUser.id;
//               }).toList()
//             : fetchedList;
//         _isLodaing = false;

//         notifyListeners();
//         _productId = null;
//         return;
//       },
//     ).catchError(
//       (error) {
//         _isLodaing = false;
//         notifyListeners();
//         return true;
//       },
//     );
//   }

//   /* Update Product */
//   Future<bool> updateProduct(
//       String title, String desc, double price, File image) async {
//     _isLodaing = true;
//     notifyListeners();
//     String imageUrl = selectedProduct.image;
//     String imagePath = selectedProduct.imagePath;
//     if (image != null) {
//       final uploadData = await uploadImage(image);
//       if (uploadData == null) {
//         print('upload Failed');
//         return false;
//       }
//       imageUrl = uploadData['imageUrl'];
//       imagePath = uploadData['imagePath'];
//     }
//     final Map<String, dynamic> updateData = {
//       'title': title,
//       'desc': desc,
//       'price': price,
//       'imageUrl': imageUrl,
//       'imagePath': imagePath,
//       'userEmail': _authUser.email,
//       'userId': _authUser.id
//     };
//     try {
//       final http.Response response = await http.put(
//           dbLink + '/${selectedProduct.id}.json?auth=${_authUser.token}',
//           body: json.encode(updateData));
//       if (response.statusCode != 200 && response.statusCode != 201) {
//         _isLodaing = false;
//         notifyListeners();
//         return false;
//       }
//       final Product updateProduct = Product(
//           id: selectedProduct.id,
//           title: title,
//           desc: desc,
//           price: price,
//           image: imageUrl,
//           imagePath: imagePath,
//           userEmail: _authUser.email,
//           userId: _authUser.id);

//       _products[selectedProductIndex] = updateProduct;
//       notifyListeners();
//       return true;
//     } catch (error) {
//       _isLodaing = false;
//       notifyListeners();
//       return true;
//     }
//   }

//   /*DELTE Product */
//   Future<bool> deleteProduct() {
//     _isLodaing = true;
//     final deletProduct = selectedProduct.id;

//     _products.removeAt(selectedProductIndex);
//     _productId = null;
//     notifyListeners();
//     return http
//         .delete(dbLink + '/$deletProduct.json?auth=${_authUser.token}')
//         .then(
//       (http.Response response) {
//         _isLodaing = false;
//         notifyListeners();
//         return true;
//       },
//     ).catchError(
//       (error) {
//         _isLodaing = false;
//         notifyListeners();
//         return true;
//       },
//     );
//   }

//   /* Toggle Fav products */
//   void toggleFav() async {
//     final bool currentFav = selectedProduct.isFav;
//     final bool newFav = !currentFav;
//     final Product updatedProduct = Product(
//       id: selectedProduct.id,
//       title: selectedProduct.title,
//       desc: selectedProduct.desc,
//       image: selectedProduct.image,
//       imagePath: selectedProduct.imagePath,
//       price: selectedProduct.price,
//       userEmail: selectedProduct.userEmail,
//       userId: selectedProduct.userId,
//       isFav: newFav,
//     );
//     _products[selectedProductIndex] = updatedProduct;
//     notifyListeners();
//     http.Response response;
//     if (newFav) {
//       response = await http.put(
//           dbLink +
//               '/${selectedProduct.id}/wishlistUser/${_authUser.id}.json?auth=${_authUser.token}',
//           body: json.encode(true));
//     } else {
//       response = await http.delete(
//         dbLink +
//             '/${selectedProduct.id}/wishlistUser/${_authUser.id}.json?auth=${_authUser.token}',
//       );
//     }

//     if (response.statusCode != 200 && response.statusCode != 201) {
//       final Product updatedProduct = Product(
//         id: selectedProduct.id,
//         title: selectedProduct.title,
//         desc: selectedProduct.desc,
//         image: selectedProduct.image,
//         imagePath: selectedProduct.imagePath,
//         price: selectedProduct.price,
//         userEmail: selectedProduct.userEmail,
//         userId: selectedProduct.userId,
//         isFav: !newFav,
//       );
//       _products[selectedProductIndex] = updatedProduct;
//       notifyListeners();
//     }
//   }

//   void selectedIndex(String productId) {
//     _productId = productId;
//     if (productId != null) {
//       notifyListeners();
//     }
//   }

//   void toggleMode() {
//     _showFav = !_showFav;
//     notifyListeners();
//   }
// }

// /* user Model */

// mixin UserModel on ConnectedProducts {
//   Timer _authTimer;
//   PublishSubject<bool> _userSubj = PublishSubject();
//   User get user {
//     return _authUser;
//   }

//   PublishSubject<bool> get userSubj {
//     return _userSubj;
//   }

//   Future<Map<FirebaseUser, dynamic>> authFunc(String email, String password,
//       [AuthMode mode = AuthMode.Login]) async {
//     _isLodaing = true;
//     notifyListeners();

//     if (mode == AuthMode.Login) {
//       AuthResult response = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       FirebaseUser user = response.user;
//     } else {
//       AuthResult response = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       FirebaseUser user = response.user;
//       return user;
//     }
//     bool hassError = true;
//     String message = '';
//     if (user.token != null) {
//       hassError = false;
//       message = "Authanticated Done!";
//       _authUser = User(id: user.id, email: user.email, token: user.token);
//       _userSubj.add(true);

//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setString('token', user.token);
//       prefs.setString('email', user.email);
//       prefs.setString('id', user.id);
//     } else if (user.email == 'EMAIL_EXISTS') {
//       message = "This Email is already exists!";
//     } else if (user.email == 'EMAIL_NOT_FOUND') {
//       message = "The E-mail is invalid!";
//     } else if (user.password == 'INVALID_PASSWORD') {
//       message = "Wrong Password!";
//     }
//     _isLodaing = false;
//     notifyListeners();
//     return {'success': !hassError, 'message': message};
//   }

//   void autoAuth() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final String token = prefs.getString('token');
//     final String expiryTimeStirng = prefs.getString('expiryTime');
//     if (token != null) {
//       final DateTime now = DateTime.now();
//       final parsedExpiryTime = DateTime.parse(expiryTimeStirng);
//       if (parsedExpiryTime.isBefore(now)) {
//         _authUser = null;
//         notifyListeners();
//         return;
//       }
//       final String userEmail = prefs.getString('userEmail');
//       final String userId = prefs.getString('userId');
//       final int tokenLifeSpan = parsedExpiryTime.difference(now).inSeconds;
//       _authUser = User(id: userId, email: userEmail, token: token);
//       _userSubj.add(true);

//       setAuthTimeOut(tokenLifeSpan);
//       notifyListeners();
//     }
//   }

//   void logout() async {
//     _authUser = null;
//     _authTimer.cancel();
//     _userSubj.add(false);

//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('token');
//     prefs.remove('userEmail');
//     prefs.remove('userId');
//   }

//   void setAuthTimeOut(int time) {
//     _authTimer = Timer(Duration(seconds: time), logout);
//   }
// }

// /* Utility Model For animation */

// mixin UtilityModel on ConnectedProducts {
//   bool get isLoading {
//     return _isLodaing;
//   }
// }
