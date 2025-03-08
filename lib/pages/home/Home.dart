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
  int index_color = 0;
  List<String> _carouselImages = [
    'assets/images/caroucel1.png',
    'assets/images/caroucel2.png',
    'assets/images/caroucel3.png',
  ];
  List _carteleraImages = [
    {
      "image": "assets/images/pelicula1.png",
      "title": "Ataque a los titanes"
    },
    {
      "image": "assets/images/pelicula2.png",
      "title": "El conjuro"
    },
    {
      "image": "assets/images/pelicula3.png",
      "title": "Rápidos y Furiosos"
    },
    {
      "image": "assets/images/pelicula4.png",
      "title": "El conjuro"
    },
  ];
  List _proximosImages = [
    {
      "image": "assets/images/proximo1.png",
      "title": "Ataque a los titanes"
    },
    {
      "image": "assets/images/proximo2.png",
      "title": "El conjuro"
    },
    {
      "image": "assets/images/proximo3.png",
      "title": "Rápidos y Furiosos"
    },
    {
      "image": "assets/images/proximo4.png",
      "title": "El conjuro"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              children: [
                // SizedBox(height: 40),
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
                SizedBox(height: 20),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cartelera',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Row(
                      children: [
                        Text('Ver todo',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _carteleraImages.map((i) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, '/login');
                          Navigator.pushNamed(context, '/moviedetail');
                        },
                        child: Container(
                          width: 120, // Ancho de cada tarjeta
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), // Bordes redondeados opcionales
                            color: Colors.black87, // Fondo oscuro para que resalte la imagen
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10), // Redondeo de la imagen
                                child: Image.asset(
                                  i["image"]!, // ✅ Corrección: acceder correctamente a la imagen
                                  fit: BoxFit.cover, // 🔥 Asegura que la imagen se recorte correctamente
                                  width: 120, // Ancho igual al contenedor
                                  height: 180, // Altura de la imagen
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                height: 30, // Altura del contenedor del título
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Text(
                                      i["title"]!, // ✅ Corrección: acceder correctamente al título
                                      textAlign: TextAlign.center, // Centrar el texto
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2, // Evita que el texto se desborde
                                      overflow: TextOverflow.ellipsis, // Añade "..." si es muy largo
                                    ),
                                  ),
                                ),
                              ),
                              // boton compara ahora
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/moviedetail');
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: primaryColor, width: 2), // Color y grosor del borde
                                    minimumSize: Size(100, 30), // Tamaño mínimo
                                  ),
                                  child: Text(
                                    'Comprar',
                                    style: TextStyle(
                                      color: primaryColor, // Color del texto
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Proximos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Row(
                      children: [
                        Text('Ver todo',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _proximosImages.map((i) {
                      return Container(
                        width: 120, // Ancho de cada tarjeta
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), // Bordes redondeados opcionales
                          color: Colors.black87, // Fondo oscuro para que resalte la imagen
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10), // Redondeo de la imagen
                              child: Image.asset(
                                i["image"]!, // ✅ Corrección: acceder correctamente a la imagen
                                fit: BoxFit.cover, // 🔥 Asegura que la imagen se recorte correctamente
                                width: 120, // Ancho igual al contenedor
                                height: 180, // Altura de la imagen
                              ),
                            ),
                            // SizedBox(height: 5),
                            Container(
                              height: 40, // Altura del contenedor del título
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    i["title"]!, // ✅ Corrección: acceder correctamente al título
                                    textAlign: TextAlign.center, // Centrar el texto
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2, // Evita que el texto se desborde
                                    overflow: TextOverflow.ellipsis, // Añade "..." si es muy largo
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 64.0,
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  index_color = 0;
                });
              },
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    index_color == 0 ? Icons.home : Icons.home_outlined,
                    color: index_color == 0 ? primaryColor : Colors.white,
                  ),
                  // const SizedBox(height: 4),
                  Text(
                    'Inicio',
                    style: TextStyle(
                      color: index_color == 0 ? primaryColor : Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index_color = 1;
                });
              },
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    index_color == 1 ? Icons.local_movies : Icons.local_movies_outlined,
                    color: index_color == 1 ? primaryColor : Colors.white,
                  ),
                  // const SizedBox(height: 4),
                  Text(
                    'Plaza',
                    style: TextStyle(
                      color: index_color == 1 ? primaryColor : Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index_color = 2;
                });
              },
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    index_color == 2 ? Icons.fastfood : Icons.fastfood_outlined,
                    color: index_color == 2 ? primaryColor : Colors.white,
                  ),
                  // const SizedBox(height: 4),
                  Text(
                    'Comida',
                    style: TextStyle(
                      color: index_color == 2 ? primaryColor : Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index_color = 3;
                });
              },
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    index_color == 3 ? Icons.movie_creation : Icons.movie_creation_outlined,
                    color: index_color == 3 ? primaryColor : Colors.white,
                  ),
                  // const SizedBox(height: 4),
                  Text(
                    'Tickets',
                    style: TextStyle(
                      color: index_color == 3 ? primaryColor : Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            // cuenta
            GestureDetector(
              onTap: () {
                setState(() {
                  index_color = 4;
                });
              },
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    index_color == 4 ? Icons.person : Icons.person_outline,
                    color: index_color == 4 ? primaryColor : Colors.white,
                  ),
                  // const SizedBox(height: 4),
                  Text(
                    'Cuenta',
                    style: TextStyle(
                      color: index_color == 4 ? primaryColor : Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
