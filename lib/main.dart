import 'package:collegemate/pages/Splash/splashscreen.dart';
import 'package:collegemate/provider/google_sign_in.dart';
import 'package:collegemate/widgets/Home_Components/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// import 'package:helloflutter/core/store.dart';
import 'package:provider/provider.dart';
// import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final Prefs = await SharedPreferences.getInstance();
  final showHome = Prefs.getBool('showHome') ?? false;
  
  await Firebase.initializeApp();
  
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp(showHome : showHome));
  }); //VxState(store: Mystore(),
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({
    Key key,
    @required this.showHome,

  }):super(key: key);
  // static final String title = 'Google SignIn';
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
          //   ChangeNotifierProvider(create: (context) => EmailSignInProvider()),
        ],
        child: MaterialApp(
          themeMode: ThemeMode.system,
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(showHome : showHome),
          //  routes: {},
        ),
      );
}