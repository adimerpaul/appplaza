import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../colors/Color.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Moviedetail extends StatefulWidget {
  const Moviedetail({super.key});

  @override
  State<Moviedetail> createState() => _MoviedetailState();
}

class _MoviedetailState extends State<Moviedetail> {
  var movie = {
    'title': 'Deadpool y wolver Unidos en la lucha',
    'image': 'assets/images/deadpool.jpg',
    'duration': '2h 14min',
    'director': 'Tim Miller',
    'ar': 'R 16+',
    'genre': 'Accion, Aventura, Comedia, Sci-Fi, Superheroes, Fantasia , Adventure, Comedy, Sci-Fi, Superheroes, Fantasy',
    'trailer': 'https://www.youtube.com/watch?v=UzFZR2dRsSY',
    'synopsis': 'Deadpool y Wolverine se unen para luchar contra un enemigo en común, pero no todo es lo que parece.',
    'cast': [
      {
        'name': 'Ryan Reynolds',
        'image': 'assets/images/ryanreynolds.jpg',
        'character': 'Deadpool',
      },
      {
        'name': 'Hugh Jackman',
        'image': 'assets/images/hughjackman.jpg',
        'character': 'Wolverine',
      },
      {
        'name': 'Morena Baccarin',
        'image': 'assets/images/morenabaccarin.jpg',
        'character': 'Vanessa',
      },
      {
        'name': 'T.J. Miller',
        'image': 'assets/images/tjmiller.jpg',
        'character': 'Weasel',
      },
      {
        'name': 'Brianna Hildebrand',
        'image': 'assets/images/briannahildebrand.jpg',
        'character': 'Negasonic Teenage Warhead',
      }
    ],
    'videos': [
      {
        'title': 'Trailer 1',
        'url': 'https://www.youtube.com/watch?v=9vN6DHB6bJc',
      },
      {
        'title': 'Trailer 2',
        'url': 'https://www.youtube.com/watch?v=UzFZR2dRsSY',
      },
      {
        'title': 'Trailer 3',
        'url': 'https://www.youtube.com/watch?v=ONHBaC-pfsk',
      },
    ],
    'photos': [
      {
        'title': 'Photo 1',
        'image': 'assets/images/deadpool1.jpg',
      },
      {
        'title': 'Photo 2',
        'image': 'assets/images/deadpool2.jpg',
      },
      {
        'title': 'Photo 3',
        'image': 'assets/images/deadpool3.jpg',
      },
    ],
    'rating': '8.5',
    'reviews': '1.5K',
  };
  List<dynamic> castList = [];
  List<dynamic> videoList = [];
  List<dynamic> photoList = [];

  late YoutubePlayerController _controller ;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    castList = movie['cast'] as List<dynamic>;
    videoList = movie['videos'] as List<dynamic>;
    photoList = movie['photos'] as List<dynamic>;
    initVideoYoutube();
  }
  String youtubeImg(String url) {
    var vCodigo = url.split('v=')[1];
    return 'https://img.youtube.com/vi/$vCodigo/0.jpg';
  }
  void playVideo() {
    _controller.play();
    setState(() {
      isPlaying = true;
    });
  }
  void initVideoYoutube() {
    var trailer = movie['trailer'].toString();
    var vCodigo = trailer.split('v=')[1];

    _controller = YoutubePlayerController(
      initialVideoId: vCodigo,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        showLiveFullscreenButton: true,
        captionLanguage: 'es',
      ),
    )..addListener(() {
      if (!_controller.value.isFullScreen) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ));
      }
    });

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          // showVideoProgressIndicator: true,
          // progressIndicatorColor: Colors.blueAccent,
          // progressColors: ProgressBarColors(
          //   playedColor: Colors.blueAccent,
          //   handleColor: Colors.blueAccent,
          // ),
          // onReady: () {
          //   print('Player is ready.');
          // },
        ),
        builder: ( context, player){
          return AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
            ),
            child: Scaffold(
                backgroundColor: backgroundColor,
                // appBar: AppBar(
                //   title: Text('Movie Detail'),
                // ),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SafeArea(
                        child: Column(
                            children: [
                              // SizedBox(height: 50),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      // Icons.arrow_back,
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      //   icon de compartir
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: IconButton(
                                          onPressed: () async {
                                            final result = await Share.share('Este es el trailer de la pelicula ${movie['title']}: ${movie['trailer']}');

                                            if (result.status == ShareResultStatus.success) {
                                              print('Thank you for sharing my website!');
                                            }
                                          },
                                          icon: Icon(
                                            Icons.share,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                    ],
                                  ),
                                ],
                              ),
                              // Text('aaa', style: TextStyle(color: Colors.white)),
                              SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          movie['image'] as String,
                                          height: 250,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          movie['title'] as String,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                'Duration',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 8,
                                              child: Text(
                                                ': ${movie['duration'] as String}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                'Director',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 8,
                                              child: Text(
                                                ': ${movie['director'] as String}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                'AR',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 8,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    ': ',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Chip(
                                                    label: Text('${movie['ar'] as String}'),
                                                    labelStyle: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                    ),
                                                    shape: StadiumBorder(
                                                      side: BorderSide(color: primaryColor, width: 1.5), // Borde blanco de 1.5 px
                                                    ),
                                                    backgroundColor: backgroundColor,
                                                    padding: EdgeInsets.all(4),
                                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                'Generos',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 8,
                                              child: Text(
                                                ': ${movie['genre'] as String}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                                // maxLines: 4,
                                                // overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Text(
                                    'Mira el trailer',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              isPlaying
                                  ? player // Si está en reproducción, muestra el video
                                  : GestureDetector(
                                onTap: playVideo, // Oculta la imagen y reproduce el video
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.network(
                                      youtubeImg(movie['trailer'] as String),
                                    ),
                                    Icon(
                                      Icons.play_circle_fill,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                            //   synopsis
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sinopsis',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                movie['synopsis'] as String,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Cast',
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
                                  children: List.generate(
                                    castList.length,  // ✅ Ahora Dart reconoce 'length'
                                        (index) {
                                      var cast = castList[index] as Map<String, dynamic>;  // ✅ Cast a Map para acceder a los valores
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(50),
                                              child: Image.asset(
                                                cast['image'] as String,
                                                height: 100,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              cast['name'] as String,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              cast['character'] as String,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),

                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Fotos',
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
                                  children: List.generate(
                                    photoList.length,  // ✅ Ahora Dart reconoce 'length'
                                        (index) {
                                      var photo = photoList[index] as Map<String, dynamic>;  // ✅ Cast a Map para acceder a los valores
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.asset(
                                                photo['image'] as String,
                                                height: 100,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ]
                        ),
                    ),
                  ),
                )
            ),
          );
        }
    );
  }
}
