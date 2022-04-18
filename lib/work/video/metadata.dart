import 'package:flutter/material.dart';
import 'package:youtube_metadata/youtube_metadata.dart' as yt;

class MetaDataa extends StatelessWidget {
  final String url;
  const MetaDataa({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<yt.MetaDataModel>(
      future: yt.YoutubeMetaData.getData(
        url,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        yt.MetaDataModel? metaData = snapshot.data;
        print(metaData);

        return Image.network(metaData!.thumbnailUrl as String);
      },
    );
  }
}
