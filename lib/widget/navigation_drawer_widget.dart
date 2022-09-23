// import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knc_learn_app/widget/page/page1/page1.dart';
import 'package:knc_learn_app/widget/page/page2.dart';
import 'package:knc_learn_app/widget/page/page3.dart';
import 'package:knc_learn_app/widget/page/page4.dart';
import 'package:knc_learn_app/widget/page/page5.dart';
import 'package:knc_learn_app/widget/page/page6.dart';
import 'package:knc_learn_app/widget/page/page7.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:knc_learn_app/Screens/home/home.dart';
// import 'package:knc_learn_app/Screens/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  final auth = FirebaseAuth.instance;
  String prefsName;
  String prefsUrlImage;
  final docUserName = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    prefsGetString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*FirebaseUser user = FirebaseAuth.getInstance().getCurrentUser();
    String name = user.getDisplayName();
    String email = user.getEmail();
    */
    final email = auth.currentUser?.email;
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: docUserName.doc(auth.currentUser.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.hasData) {
            if (prefsName != null && prefsUrlImage != null) {
              return buildDrawer(
                context: context,
                name: prefsName,
                urlImage: prefsUrlImage,
                email: email,
              );
            } else {
              final data = snapshot.data.data();
              final String frontName = data['frontname'];
              final String lastName = data['lastname'];
              final String urlImage = data['urlprofilepic'];
              final String name = '$frontName $lastName';
              prefsSetString(name: name, urlImage: urlImage);
              return buildDrawer(
                context: context,
                name: name,
                urlImage: urlImage,
                email: email,
              );
            }
          }
          return buildDrawer(
            context: context,
            name: prefsName ?? 'User Name',
            urlImage: prefsUrlImage ??
                'https://png.pngitem.com/pimgs/s/130-1300380_female-user-image-icon-hd-png-download.png',
            email: email,
          );
        });
  }

  Future<void> prefsGetString() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefsName = prefs.getString('name');
      prefsUrlImage = prefs.getString('urlImage');
    });
  }

  Future<void> prefsSetString({
    @required String name,
    @required String urlImage,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('name', name);
      prefs.setString('urlImage', urlImage);
    });
  }

  Widget buildDrawer({
    @required context,
    @required String name,
    @required String urlImage,
    @required String email,
  }) {
    return Drawer(
      child: Material(
        color: const Color.fromARGB(255, 131, 177, 247),
        child: ListView(
          // padding: padding,
          children: <Widget>[
            buildHeader(
              context: context,
              urlImage: urlImage,
              name: name,
              email: email,
            ),
            Container(
              padding: padding,
              child: auth.currentUser?.email == 'admin_builder@knc.ac.th'
                  ? adminColumn()
                  : userColumn(),
            ),
          ],
        ),
      ),
    );
  }

  Widget userColumn() {
    return Column(
      children: [
        const SizedBox(
          height: 4,
        ),
        buildMenuItem(
          text: "Favourites",
          icon: Icons.favorite_border,
          onClicked: () => selectedItem(context, 2),
        ),
        const SizedBox(
          height: 4,
        ),
        buildMenuItem(
          text: "References",
          icon: Icons.workspaces_outline,
          onClicked: () => selectedItem(context, 3),
        ),
        const SizedBox(
          height: 4,
        ),
        buildMenuItem(
          text: "Creator List",
          icon: Icons.people_rounded,
          onClicked: () => selectedItem(context, 4),
        ),
        const SizedBox(
          height: 12,
        ),
        const Divider(
          color: Colors.white,
        ),
        const SizedBox(
          height: 12,
        ),
        buildMenuItem(
          text: "Notifications",
          icon: Icons.notifications_outlined,
          onClicked: () => selectedItem(context, 5),
        ),
        const SizedBox(
          height: 4,
        ),
        buildMenuItem(
          text: "Settings",
          icon: Icons.settings,
          onClicked: () => selectedItem(context, 6),
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }

  Widget adminColumn() {
    return Column(
      children: [
        const SizedBox(
          height: 4,
        ),
        buildMenuItem(
          text: "Favourites",
          icon: Icons.favorite_border,
          onClicked: () => selectedItem(context, 2),
        ),
        const SizedBox(
          height: 4,
        ),
        buildMenuItem(
          text: "References",
          icon: Icons.workspaces_outline,
          onClicked: () => selectedItem(context, 3),
        ),
        const SizedBox(
          height: 4,
        ),
        buildMenuItem(
          text: "Creator List",
          icon: Icons.people_rounded,
          onClicked: () => selectedItem(context, 4),
        ),
        const SizedBox(
          height: 12,
        ),
        const Divider(
          color: Colors.white,
        ),
        const SizedBox(
          height: 12,
        ),
        buildMenuItem(
          text: "Notifications",
          icon: Icons.notifications_outlined,
          onClicked: () => selectedItem(context, 5),
        ),
        const SizedBox(
          height: 4,
        ),
        buildMenuItem(
          text: "Settings",
          icon: Icons.settings,
          onClicked: () => selectedItem(context, 6),
        ),
        const SizedBox(
          height: 12,
        ),
        const Divider(
          color: Colors.white,
        ),
        const SizedBox(
          height: 12,
        ),
        buildMenuItem(
          text: "Admin",
          icon: Icons.settings,
          onClicked: () => selectedItem(context, 7),
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }

  Widget buildMenuItem({
    @required String text,
    @required IconData icon,
    onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.transparent;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: const TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      selectedColor: hoverColor,
      selectedTileColor: hoverColor,
      focusColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Page1(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Page2(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Page3(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Page4(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Page5(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Page6(),
        ));
        break;
      case 7:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const Page7(),
            ),
            (Route<dynamic> route) => route.isFirst);
        break;
      default:
    }
  }

  Widget buildHeader({
    @required String urlImage,
    @required String name,
    @required email,
    @required context,
  }) {
    return InkWell(
      onTap: () async {
        await SystemSound.play(SystemSoundType.click).then(
          (value) {
            selectedItem(context, 1);
          },
        );
      },
      child: Container(
        padding: padding
            .add(const EdgeInsets.symmetric(vertical: 10, horizontal: 0)),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(urlImage),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "SukhumvitSet",
                      color: Colors.white),
                ),
                const SizedBox(height: 2),
                Text(
                  email,
                  style: const TextStyle(
                      fontSize: 12,
                      fontFamily: "SukhumvitSet",
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
