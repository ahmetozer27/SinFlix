import 'package:dating_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {

  static Future<void> initializeFirebase() async{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  // static Future<void> initializeFirebaseCrashlytics() async{
  //   // Crashlytics hataları yakala
  //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // }
  //
  // static Future<void> initializeFirebaseAnalytics() async{
  //   // Analstyic verisi
  //   final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // }
}