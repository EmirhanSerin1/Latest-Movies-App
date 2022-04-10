import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SingleFilmItem extends StatefulWidget {
  const SingleFilmItem({
    Key? key,
    required this.widget,
    required this.name,
    required this.imagePath,
    required this.alignment,
  }) : super(key: key);

  final String name, imagePath;
  final Widget widget;
  final Alignment alignment;
  @override
  State<SingleFilmItem> createState() => _SingleFilmItemState();
}

class _SingleFilmItemState extends State<SingleFilmItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(width: 1, color: Colors.red.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(8),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.red.withOpacity(0.5),
          //     offset: const Offset(0, 3),
          //     blurRadius: 3,
          //   ),
          // ],
          color: Colors.grey.shade800,
        ),
        child: InkWell(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => widget.widget)),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.red.withOpacity(0.5),
                        //     offset: const Offset(1, 3),
                        //     blurRadius: 3,
                        //   ),
                        // ],
                        image: DecorationImage(
                          alignment: widget.alignment,
                            image: CachedNetworkImageProvider(widget.imagePath),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        width: MediaQuery.of(context).size.width /2.6,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
