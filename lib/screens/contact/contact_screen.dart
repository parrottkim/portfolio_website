import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/contact/widgets/contact_background.dart';
import 'package:portfolio_website/screens/contact/widgets/contact_introduction.dart';
import 'package:portfolio_website/screens/main/controller/main_controller.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    final provider = context.watch<MainController>();

    return provider.screens[3]['isLoaded']
        ? Stack(
            alignment: Alignment.center,
            children: [
              ContactBackground(size: size),
              ContactIntroduction(size: size),
            ],
          )
        : SizedBox(width: size.width, height: size.height * 0.7);
  }

  @override
  bool get wantKeepAlive => true;
}
