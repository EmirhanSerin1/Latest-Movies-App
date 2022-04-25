import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: SignInScreen(
            headerBuilder: (context, constraints, shrinkOffset) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://cdn.pixabay.com/photo/2016/01/22/08/17/banner-1155437_960_720.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            providerConfigs: const [
              EmailProviderConfiguration(),
              // GoogleProviderConfiguration(
              //   clientId:
              //       '73640989291-c0l6vi0v9o2hhvoqjmfrl9k6t1h8pv1e.apps.googleusercontent.com',
              // ),
              // PhoneProviderConfiguration()
            ],
          ),
        ),
      ),
    );
  }
}
