import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SingleFilmItem extends StatelessWidget {
  const SingleFilmItem({
    Key? key,
    required this.widget,
    required this.name,
    required this.imagePath,
  }) : super(key: key);

  final String name, imagePath;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.red.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              offset: const Offset(0, 3),
              blurRadius: 3,
            ),
          ],
          color: Colors.grey.shade800,
        ),
        child: InkWell(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => widget)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 4.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.5),
                              offset: const Offset(1, 3),
                              blurRadius: 3,
                            ),
                          ],
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(imagePath),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    flex: 26,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    flex: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
