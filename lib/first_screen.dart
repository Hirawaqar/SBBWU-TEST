import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  //INITIALIZING DIO LIBRARY
  Dio dio = Dio();

// Variables and Functions Area
  int id = 1;
  List studentsInfo = [];
  List products = [];

//FUNCTION RESPONSIBLE FOR GETTING DATA FROM LOCAL JSON FILE
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await jsonDecode(response);
    setState(() {
      studentsInfo = data["studentsInfo"];
    });
  }

// API CALL FOR GETTING DATA FROM API SERVER
  Future<void> getAPIcall() async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);
    var data = await json.decode(response.body);
    setState(() {
      products = data['products'];
    });
  }

  //SAME GET API CALL USING DIO LIBRARY
  Future<void> getAPIcallDio() async {
    var url = 'https://dummyjson.com/products';
    try {
      var response = await dio.get(url);
      setState(() {
        products = response.data['products'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    // readJson();
    //getAPIcall();
    getAPIcallDio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          'Products',
          style: TextStyle(
            color: Colors.black,
            fontSize: 50,
            fontFamily: 'Caros',
          ),
          // style: GoogleFonts.lato(
          //  color: colors.black)
          // style: TextStyle(
          // color: Colors.black,
          //  fontsize: 50,
          // fontWeight: FontWeight.bold,
          // ),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              GestureDetector(
                //onTap: () {
                //navigation from one screen to another screen
                //Navigator.push(
                //context,
                //MaterialPageRoute(
                //  builder: (context) => SecondScreen(
                //      studentsInfo[index]['id'],
                //    studentsInfo[index]['Name'],
                //  studentsInfo[index]['fatherName'],
                //studentsInfo[index]['dept'],
                //studentsInfo[index]['description'],
                //)),
                //);
                //},
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: CachedNetworkImage(
                      imageUrl: ('${products[index]['thumbnail']}'),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                    ),
                  ),
                  //Text(
                  //''${products[index]['id']}',
                  //style: const Texstyle(
                  //colors: colors.white,
                  //fontsize: 20,
                  //fonweight: Fontweight.bold,
                  //),
                  //),
                  title: Text(
                    '${products[index]['title']}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${products[index]['brand']}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                  ), //Icon
                ), //ListTile
              ),
              const Divider(
                color: Colors.black,
              ),
            ],
          );
        },
      ),
    );
  }
}
