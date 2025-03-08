import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../colors/Color.dart';
import 'package:share_plus/share_plus.dart';

class Moviedetail extends StatefulWidget {
  const Moviedetail({super.key});

  @override
  State<Moviedetail> createState() => _MoviedetailState();
}

class _MoviedetailState extends State<Moviedetail> {
  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
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
                      padding: const EdgeInsets.only(right: 20),
                      child: IconButton(
                        onPressed: () async {
                          final result = await Share.share('check out my website https://example.com');

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
                    SizedBox(width: 20),
                  ],
                ),
              ],
            ),
          ]
        )
      ),
    );
  }
}
