# Resume Demo

A demo ecommerce flutter project for resume

## Project Details

### SDK

| Name          | Version       |
| ------------- |:-------------:|
| Flutter       | 2.10.4        |
| Dart.         | 2.16.2        |

### Editor
Android Studio Arctic Fox | 2020.3.1 Patch 4\
Build #AI-203.7717.56.2031.7935034, built on November 21, 2021\
Runtime version: 11.0.10+0-b96-7249189 aarch64\
VM: OpenJDK 64-Bit Server VM by JetBrains s.r.o.\
macOS 11.5.1\
GC: G1 Young Generation, G1 Old Generation\
Memory: 1280M\
Cores: 8

### Structure
Architecture : MVC\
State Management: GETX

### Folder Structure
```
resume_demo
└───android
└───ios
└───pubspec.yaml
└───README.md
│
└───assets
│   └───fonts
│   └───gif
│   └───image
│   └───demo_apk
│   
└───lib
    │   main.dart
    │   resume_demo.dart   
    │
    └───app
        │
        └───common
        │   │   constants.dart
        │   │   app_controller.dart
        │   │
        │   └───helper
        │   │   │   helper.dart
        │   │   │
        │   │   └───helper_data
        │   │   │      helper_data.dart
        │   │   │
        │   │   └───helper_methods
        │   │         helper_data.dart
        │   │
        │   └───language
        │   │      translation.dart
        │   │      bn_bd.dart
        │   │      en_us.dart
        │   │   
        │   └───storage
        │   │      storage.dart
        │   │      storage_helper.dart
        │   │  
        │   └───util
        │   │      exports.dart
        │   │      extensions.dart
        │   │      initializer.dart
        │   │      utils.dart
        │   │      validators.dart
        │   │  
        │   └───values
        │       │   app_assets.dart
        │       │   app_colors.dart
        │       │   dimens.dart
        │       │   strings.dart
        │       │
        │       └───styles
        │              app_text_style.dart
        │              theme.dart
        │   
        └───services
        │      api_helper.dart
        │      api_helper_impl.dart
        │      interceptor.dart
        │   
        └───models
        │      ................
        │      ................
        │      ................
        │      all_models.dart
        │   
        └───modules
        │      ................
        │      ................
        │      ................
        │      all_modules.dart
        │   
        └───routes
               app_pages.dart
               app_routes.dart
```

## Introduction
- This project create for share git repo when apply in new company.

- In this project I used [fakestoreapi](https://fakestoreapi.com/docs) demo apis. you can read more about the free apis [Here](https://fakestoreapi.com/docs).

- [fakestoreapi](https://fakestoreapi.com/docs) offers free api for ecommerce


## Features
* **Login**
    * Username
    * Password
  ###### NB: username and password are fixed
* **Products**
    * Show all products
    * Single product details
* **Category**
    * Show all Categories
    * Show a single category product
* **Cart**
    * Add product to cart
    * Delete product from cart
    * Update quantity in cart
    * Show all Cart Products
* **Order**
    * Placed order
    * Show order status
* **Chat**
  * Chat with simsimi
  ###### NB: Simsimi demo api offer 100 request per api
  

Future Development
user: Add, Update, Delete
product: Add, Update, Delete



## App Version
Find demo apk in `assets/demo_apk` folder

Version format: __a.b.c.d__ \
__a__ : App version\
__b__ : Working version\
__c__ : Current version change\
__d__ : Total version change

>Tue 21 apr 2022 `0.0.0.1`
>>initial realized