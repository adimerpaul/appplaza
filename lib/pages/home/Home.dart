import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../colors/Color.dart';
import 'package:badges/badges.dart' as badges;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<String> _carouselImages = [
    'assets/images/caroucel1.png',
    'assets/images/caroucel2.png',
    'assets/images/caroucel3.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Image.asset(
                    //   'assets/images/photo.jpg',
                    //   height: 50,
                    // ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/photo.jpg'),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Oruro - Bolivia',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Adimer Paul Chambi Ajata',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                badges.Badge(
                  badgeContent: Text(''),
                  position: badges.BadgePosition.topEnd(top: 0, end: 5),
                  child: IconButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/login');
                    },
                    icon: Icon(
                      // icono campaniat
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            CarouselSlider(
              items: _carouselImages.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5), // Esquinas redondeadas opcionales
                        color: Colors.amber,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5), // Redondeo opcional
                        child: Image.asset(
                          i,
                          fit: BoxFit.cover, // 🔥 Asegura que la imagen se recorte correctamente
                          width: double.infinity, // Ajusta al ancho del contenedor
                          height: 180, // Altura del carrusel
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _carouselImages.map((url) {
                int index = _carouselImages.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                  ),
                );
              }).toList(),
            ),
            Text('Home Page',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}
