import 'package:flutter/material.dart';
import 'dart:async';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

void main() =>  {
  runApp(MaterialApp(
    home:MyApp(),
  ))
};

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
          () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHOME(),
            ));
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        child: Center(
            child: Image.asset("images/final.jpg",
                height: double.infinity,
                width:double.infinity)
        ),
        snackBar: const SnackBar(content:Text("Tap back again to exit") ),
      )
    );
  }
}


class MyHOME extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      Mynewitems.routeName: (BuildContext context) =>
          new Mynewitems(title: "Mynewitems"),
    };
    return MaterialApp(
      home: MyHomePage(),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {
      Navigator.pushNamed(context, Mynewitems.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,

      body: Center(
          child:RaisedButton(
                  color: Colors.brown,
                  child: Text(
                    "Start Reading",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  elevation: 8.0,
                  onPressed: (_incrementCounter) )
              ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Mynewitems extends StatefulWidget {
  Mynewitems({Key key, this.title}) : super(key: key);

  static const String routeName = "/Mynewitems";

  final String title;

  @override
  _MynewitemsState createState() => new _MynewitemsState();
}

class _MynewitemsState extends State<Mynewitems> {
  ScrollController _scrollController;

  List allSlides = [
    {'slideName': 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِیْمِ', 'selected': false},
    {'slideName': 'یٰسٓۚ(۱)', 'selected': false},
    {'slideName': 'وَ الْقُرْاٰنِ الْحَكِیْمِۙ(۲)', 'selected': false},
    {'slideName': 'اِنَّكَ لَمِنَ الْمُرْسَلِیْنَۙ(۳)', 'selected': false},
    {'slideName': ' عَلٰى صِرَاطٍ مُّسْتَقِیْمٍؕ(۴)', 'selected': false},
    {'slideName': 'تَنْزِیْلَ الْعَزِیْزِ الرَّحِیْمِۙ(۵)', 'selected': false},
    {
      'slideName':
          'لِتُنْذِرَ قَوْمًا مَّاۤنْذِرَاٰبَآؤُهُمْ فَهُمْ غٰفِلُوْنَ(۶) ',
      'selected': false
    },
    {
      'slideName':
          'لَقَدْ حَقَّ الْقَوْلُ عَلٰۤى اَكْثَرِهِمْ فَهُمْ لَا یُؤْمِنُوْنَ(۷)',
      'selected': false
    },
    {
      'slideName':
          'اِنَّا جَعَلْنَا فِیْۤ اَعْنَاقِهِمْ اَغْلٰلًا فَهِیَ اِلَى الْاَذْقَانِ فَهُمْ مُّقْمَحُوْنَ(۸)',
      'selected': false
    },
    {
      'slideName':
          'وَ جَعَلْنَا مِنْۢ بَیْنِ اَیْدِیْهِمْ سَدًّا وَّ مِنْ خَلْفِهِمْ سَدًّا فَاَغْشَیْنٰهُمْ فَهُمْ لَا یُبْصِرُوْنَ(۹)',
      'selected': false
    },
    {
      'slideName':
          'وَ سَوَآءٌ عَلَیْهِمْ ءَاَنْذَرْتَهُمْ اَمْ لَمْ تُنْذِرْهُمْ لَا یُؤْمِنُوْنَ(۱۰)',
      'selected': false
    },
    {
      'slideName':
          'اِنَّمَا تُنْذِرُ مَنِ اتَّبَعَ الذِّكْرَ وَ خَشِیَ الرَّحْمٰنَ بِالْغَیْبِۚ-فَبَشِّرْهُ بِمَغْفِرَةٍ وَّ اَجْرٍ كَرِیْمٍ(۱۱)',
      'selected': false
    },
    {
      'slideName':
          'اِنَّا نَحْنُ نُحْیِ الْمَوْتٰى وَ نَكْتُبُ مَا قَدَّمُوْا وَ اٰثَارَهُمْۣؕ-وَ كُلَّ شَیْءٍ اَحْصَیْنٰهُ فِیْۤ اِمَامٍ مُّبِیْنٍ۠(۱۲)',
      'selected': false
    },
    {
      'slideName':
          'وَ اضْرِبْ لَهُمْ مَّثَلًا اَصْحٰبَ الْقَرْیَةِۘ-اِذْ جَآءَهَا الْمُرْسَلُوْنَۚ(۱۳)',
      'selected': false
    },
    {'slideName': 'اِذْ اَرْسَلْنَاۤ اِلَیْهِمُ اثْنَیْنِ فَكَذَّبُوْهُمَا فَعَزَّزْنَا بِثَالِثٍ فَقَالُوْۤا اِنَّاۤ اِلَیْكُمْ مُّرْسَلُوْنَ(۱۴)', 'selected': false},
    {'slideName': 'قَالُوْا مَاۤ اَنْتُمْ اِلَّا بَشَرٌ مِّثْلُنَاۙ-وَ مَاۤ اَنْزَلَ الرَّحْمٰنُ مِنْ شَیْءٍۙ-اِنْ اَنْتُمْ اِلَّا تَكْذِبُوْنَ(۱۵)', 'selected': false},

    {'slideName': 'قَالُوْا رَبُّنَا یَعْلَمُ اِنَّاۤ اِلَیْكُمْ لَمُرْسَلُوْنَ(۱۶)', 'selected': false},
    {'slideName': 'وَ مَا عَلَیْنَاۤ اِلَّا الْبَلٰغُ الْمُبِیْنُ(۱۷)', 'selected': false},
    {'slideName': 'قَالُوْۤا اِنَّا تَطَیَّرْنَا بِكُمْۚ-لَىٕنْ لَّمْ تَنْتَهُوْا لَنَرْجُمَنَّكُمْ وَ لَیَمَسَّنَّكُمْ مِّنَّا عَذَابٌ اَلِیْمٌ(۱۸)', 'selected': false},
    {'slideName': 'قَالُوْا طَآىٕرُكُمْ مَّعَكُمْؕ-اَىٕنْ ذُكِّرْتُمْؕ-بَلْ اَنْتُمْ قَوْمٌ مُّسْرِفُوْنَ(۱۹)', 'selected': false},
    {'slideName': 'وَ جَآءَ مِنْ اَقْصَا الْمَدِیْنَةِ رَجُلٌ یَّسْعٰى قَالَ یٰقَوْمِ اتَّبِعُوا الْمُرْسَلِیْنَۙ(۲۰)', 'selected': false},
    {'slideName': 'اتَّبِعُوْا مَنْ لَّا یَسْــٴَـلُكُمْ اَجْرًا وَّ هُمْ مُّهْتَدُوْنَ(۲۱)', 'selected': false},
    {'slideName': 'وَ مَا لِیَ لَاۤ اَعْبُدُ الَّذِیْ فَطَرَنِیْ وَ اِلَیْهِ تُرْجَعُوْنَ(۲۲)', 'selected': false},
    {'slideName': 'ءَاَتَّخِذُ مِنْ دُوْنِهٖۤ اٰلِهَةً اِنْ یُّرِدْنِ الرَّحْمٰنُ بِضُرٍّ لَّا تُغْنِ عَنِّیْ شَفَاعَتُهُمْ شَیْــٴًـا وَّ لَا یُنْقِذُوْنِۚ(۲۳)', 'selected': false},
    {'slideName': 'اِنِّیْۤ اِذًا لَّفِیْ ضَلٰلٍ مُّبِیْنٍ(۲۴)', 'selected': false},
    {'slideName': 'اِنِّیْۤ اٰمَنْتُ بِرَبِّكُمْ فَاسْمَعُوْنِؕ(۲۵)', 'selected': false},

    {'slideName': 'قِیْلَ ادْخُلِ الْجَنَّةَؕ-قَالَ یٰلَیْتَ قَوْمِیْ یَعْلَمُوْنَۙ(۲۶)', 'selected': false},
    {'slideName': 'بِمَا غَفَرَ لِیْ رَبِّیْ وَ جَعَلَنِیْ مِنَ الْمُكْرَمِیْنَ(۲۷)', 'selected': false},
    {'slideName': 'وَ مَاۤ اَنْزَلْنَا عَلٰى قَوْمِهٖ مِنْۢ بَعْدِهٖ مِنْ جُنْدٍ مِّنَ السَّمَآءِ وَ مَا كُنَّا مُنْزِلِیْنَ(۲۸)', 'selected': false},
    {'slideName': 'اِنْ كَانَتْ اِلَّا صَیْحَةً وَّاحِدَةً فَاِذَا هُمْ خٰمِدُوْنَ(۲۹)', 'selected': false},
    {'slideName': 'یٰحَسْرَةً عَلَى الْعِبَادِۣۚ-مَا یَاْتِیْهِمْ مِّنْ رَّسُوْلٍ اِلَّا كَانُوْا بِهٖ یَسْتَهْزِءُوْنَ(۳۰)', 'selected': false},
    {'slideName': ' اَلَمْ یَرَوْا كَمْ اَهْلَكْنَا قَبْلَهُمْ مِّنَ الْقُرُوْنِ اَنَّهُمْ اِلَیْهِمْ لَا یَرْجِعُوْنَؕ(۳۱)', 'selected': false},

    {'slideName': 'وَ اِنْ كُلٌّ لَّمَّا جَمِیْعٌ لَّدَیْنَا مُحْضَرُوْنَ۠(۳۲)', 'selected': false},

    {'slideName': 'وَ اٰیَةٌ لَّهُمُ الْاَرْضُ الْمَیْتَةُ ۚۖ-اَحْیَیْنٰهَا وَ اَخْرَجْنَا مِنْهَا حَبًّا فَمِنْهُ یَاْكُلُوْنَ(۳۳)', 'selected': false},

    {'slideName': 'وَ جَعَلْنَا فِیْهَا جَنّٰتٍ مِّنْ نَّخِیْلٍ وَّ اَعْنَابٍ وَّ فَجَّرْنَا فِیْهَا مِنَ الْعُیُوْنِۙ(۳۴)', 'selected': false},

    {'slideName': 'لِیَاْكُلُوْا مِنْ ثَمَرِهٖۙ-وَ مَا عَمِلَتْهُ اَیْدِیْهِمْؕ-اَفَلَا یَشْكُرُوْنَ(۳۵)', 'selected': false},

    {'slideName': 'سُبْحٰنَ الَّذِیْ خَلَقَ الْاَزْوَاجَ كُلَّهَا مِمَّا تُنْۢبِتُ الْاَرْضُ وَ مِنْ اَنْفُسِهِمْ وَ مِمَّا لَا یَعْلَمُوْنَ(۳۶)', 'selected': false},

    {'slideName': 'وَ اٰیَةٌ لَّهُمُ الَّیْلُ ۚۖ-نَسْلَخُ مِنْهُ النَّهَارَ فَاِذَا هُمْ مُّظْلِمُوْنَۙ(۳۷)', 'selected': false},

    {'slideName': 'وَ الشَّمْسُ تَجْرِیْ لِمُسْتَقَرٍّ لَّهَاؕ-ذٰلِكَ تَقْدِیْرُ الْعَزِیْزِ الْعَلِیْمِؕ(۳۸)', 'selected': false},

    {'slideName': 'وَ الْقَمَرَ قَدَّرْنٰهُ مَنَازِلَ حَتّٰى عَادَ كَالْعُرْجُوْنِ الْقَدِیْمِ(۳۹)', 'selected': false},

    {'slideName': 'لَا الشَّمْسُ یَنْۢبَغِیْ لَهَاۤ اَنْ تُدْرِكَ الْقَمَرَ وَ لَا الَّیْلُ سَابِقُ النَّهَارِؕ-وَ كُلٌّ فِیْ فَلَكٍ یَّسْبَحُوْنَ(۴۰)', 'selected': false},


    {'slideName': 'وَ اٰیَةٌ لَّهُمْ اَنَّا حَمَلْنَا ذُرِّیَّتَهُمْ فِی الْفُلْكِ الْمَشْحُوْنِۙ(۴۱)', 'selected': false},

    {'slideName': 'وَ خَلَقْنَا لَهُمْ مِّنْ مِّثْلِهٖ مَا یَرْكَبُوْنَ(۴۲)', 'selected': false},

    {'slideName': 'وَ اِنْ نَّشَاْ نُغْرِقْهُمْ فَلَا صَرِیْخَ لَهُمْ وَ لَا هُمْ یُنْقَذُوْنَۙ(۴۳)', 'selected': false},

    {'slideName': 'اِلَّا رَحْمَةً مِّنَّا وَ مَتَاعًا اِلٰى حِیْنٍ(۴۴)', 'selected': false},

    {'slideName': 'وَ اِذَا قِیْلَ لَهُمُ اتَّقُوْا مَا بَیْنَ اَیْدِیْكُمْ وَ مَا خَلْفَكُمْ لَعَلَّكُمْ تُرْحَمُوْنَ(۴۵)', 'selected': false},

    {'slideName': 'وَ مَا تَاْتِیْهِمْ مِّنْ اٰیَةٍ مِّنْ اٰیٰتِ رَبِّهِمْ اِلَّا كَانُوْا عَنْهَا مُعْرِضِیْنَ(۴۶)', 'selected': false},

    {'slideName': 'وَ اِذَا قِیْلَ لَهُمْ اَنْفِقُوْا مِمَّا رَزَقَكُمُ اللّٰهُۙ-قَالَ الَّذِیْنَ كَفَرُوْا لِلَّذِیْنَ اٰمَنُوْۤا اَنُطْعِمُ مَنْ لَّوْ یَشَآءُ اللّٰهُ اَطْعَمَهٗۤ ﳓ اِنْ اَنْتُمْ اِلَّا فِیْ ضَلٰلٍ مُّبِیْنٍ(۴۷)', 'selected': false},

    {'slideName': 'وَ یَقُوْلُوْنَ مَتٰى هٰذَا الْوَعْدُ اِنْ كُنْتُمْ صٰدِقِیْنَ(۴۸)', 'selected': false},

    {'slideName': 'مَا یَنْظُرُوْنَ اِلَّا صَیْحَةً وَّاحِدَةً تَاْخُذُهُمْ وَ هُمْ یَخِصِّمُوْنَ(۴۹)', 'selected': false},

    {'slideName': 'فَلَا یَسْتَطِیْعُوْنَ تَوْصِیَةً وَّ لَاۤ اِلٰۤى اَهْلِهِمْ یَرْجِعُوْنَ۠(۵۰)', 'selected': false},

    {'slideName': 'وَ نُفِخَ فِی الصُّوْرِ فَاِذَا هُمْ مِّنَ الْاَجْدَاثِ اِلٰى رَبِّهِمْ یَنْسِلُوْنَ(۵۱)', 'selected': false},

    {'slideName': 'قَالُوْا یٰوَیْلَنَا مَنْۢ بَعَثَنَا مِنْ مَّرْقَدِنَاﱃ هٰذَا مَا وَعَدَ الرَّحْمٰنُ وَ صَدَقَ الْمُرْسَلُوْنَ(۵۲)', 'selected': false},

    {'slideName': 'اِنْ كَانَتْ اِلَّا صَیْحَةً وَّاحِدَةً فَاِذَا هُمْ جَمِیْعٌ لَّدَیْنَا مُحْضَرُوْنَ(۵۳)', 'selected': false},

    {'slideName': 'فَالْیَوْمَ لَا تُظْلَمُ نَفْسٌ شَیْــٴًـا وَّ لَا تُجْزَوْنَ اِلَّا مَا كُنْتُمْ تَعْمَلُوْنَ(۵۴)', 'selected': false},

    {'slideName': 'اِنَّ اَصْحٰبَ الْجَنَّةِ الْیَوْمَ فِیْ شُغُلٍ فٰكِهُوْنَۚ(۵۵)', 'selected': false},

    {'slideName': 'هُمْ وَ اَزْوَاجُهُمْ فِیْ ظِلٰلٍ عَلَى الْاَرَآىٕكِ  مُتَّكِــٴُـوْنَ(۵۶)', 'selected': false},

    {'slideName': 'لَهُمْ فِیْهَا فَاكِهَةٌ وَّ لَهُمْ مَّا یَدَّعُوْنَۚۖ(۵۷)', 'selected': false},

    {'slideName': 'سَلٰمٌ- قَوْلًا مِّنْ رَّبٍّ رَّحِیْمٍ(۵۸)', 'selected': false},

    {'slideName': 'وَ امْتَازُوا الْیَوْمَ اَیُّهَا الْمُجْرِمُوْنَ(۵۹)', 'selected': false},

    {'slideName': 'اَلَمْ اَعْهَدْ اِلَیْكُمْ یٰبَنِیْۤ اٰدَمَ اَنْ لَّا تَعْبُدُوا الشَّیْطٰنَۚ-اِنَّهٗ لَكُمْ عَدُوٌّ مُّبِیْنٌۙ(۶۰)', 'selected': false},

    {'slideName': 'وَّ اَنِ اعْبُدُوْنِیْﳳ-هٰذَا صِرَاطٌ مُّسْتَقِیْمٌ(۶۱)', 'selected': false},

    {'slideName': 'وَ لَقَدْ اَضَلَّ مِنْكُمْ جِبِلًّا كَثِیْرًاؕ-اَفَلَمْ تَكُوْنُوْا تَعْقِلُوْنَ(۶۲)', 'selected': false},

    {'slideName': 'هٰذِهٖ جَهَنَّمُ الَّتِیْ كُنْتُمْ تُوْعَدُوْنَ(۶۳)', 'selected': false},

    {'slideName': 'اِصْلَوْهَا الْیَوْمَ بِمَا كُنْتُمْ تَكْفُرُوْنَ(۶۴)', 'selected': false},

    {'slideName': 'اَلْیَوْمَ نَخْتِمُ عَلٰۤى اَفْوَاهِهِمْ وَ تُكَلِّمُنَاۤ اَیْدِیْهِمْ وَ تَشْهَدُ اَرْجُلُهُمْ بِمَا كَانُوْا یَكْسِبُوْنَ(۶۵)', 'selected': false},

    {'slideName': 'وَ لَوْ نَشَآءُ لَطَمَسْنَا عَلٰۤى اَعْیُنِهِمْ فَاسْتَبَقُوا الصِّرَاطَ فَاَنّٰى یُبْصِرُوْنَ(۶۶)', 'selected': false},

    {'slideName': 'وَ لَوْ نَشَآءُ لَمَسَخْنٰهُمْ عَلٰى مَكَانَتِهِمْ فَمَا اسْتَطَاعُوْا مُضِیًّا وَّ لَا یَرْجِعُوْنَ۠(۶۷)', 'selected': false},

    {'slideName': 'وَ مَنْ نُّعَمِّرْهُ نُنَكِّسْهُ فِی الْخَلْقِؕ-اَفَلَا یَعْقِلُوْنَ(۶۸)', 'selected': false},

    {'slideName': 'وَ مَا عَلَّمْنٰهُ الشِّعْرَ وَ مَا یَنْۢبَغِیْ لَهٗؕ-اِنْ هُوَ اِلَّا ذِكْرٌ وَّ قُرْاٰنٌ مُّبِیْنٌۙ(۶۹)', 'selected': false},

    {'slideName': 'اِصْلَوْهَا الْیَوْمَ بِمَا كُنْتُمْ تَكْفُرُوْنَ(۶۴)', 'selected': false},

    {'slideName': 'لِّیُنْذِرَ مَنْ كَانَ حَیًّا وَّ یَحِقَّ الْقَوْلُ عَلَى الْكٰفِرِیْنَ(۷۰)', 'selected': false},

    {'slideName': 'اَوَ لَمْ یَرَوْا اَنَّا خَلَقْنَا لَهُمْ مِّمَّا عَمِلَتْ اَیْدِیْنَاۤ اَنْعَامًا فَهُمْ لَهَا مٰلِكُوْنَ(۷۱)', 'selected': false},

    {'slideName': 'وَ ذَلَّلْنٰهَا لَهُمْ فَمِنْهَا رَكُوْبُهُمْ وَ مِنْهَا یَاْكُلُوْنَ(۷۲)', 'selected': false},

    {'slideName': 'وَ لَهُمْ فِیْهَا مَنَافِعُ وَ مَشَارِبُؕ-اَفَلَا یَشْكُرُوْنَ(۷۳)', 'selected': false},

    {'slideName': 'وَ اتَّخَذُوْا مِنْ دُوْنِ اللّٰهِ اٰلِهَةً لَّعَلَّهُمْ یُنْصَرُوْنَؕ(۷۴)', 'selected': false},

    {'slideName': 'لَا یَسْتَطِیْعُوْنَ نَصْرَهُمْۙ-وَ هُمْ لَهُمْ جُنْدٌ مُّحْضَرُوْنَ(۷۵)', 'selected': false},

    {'slideName': 'فَلَا یَحْزُنْكَ قَوْلُهُمْۘ-اِنَّا نَعْلَمُ مَا یُسِرُّوْنَ وَ مَا یُعْلِنُوْنَ(۷۶)', 'selected': false},

    {'slideName': 'اَوَ لَمْ یَرَ الْاِنْسَانُ اَنَّا خَلَقْنٰهُ مِنْ نُّطْفَةٍ فَاِذَا هُوَ خَصِیْمٌ مُّبِیْنٌ(۷۷)', 'selected': false},

    {'slideName': 'وَ ضَرَبَ لَنَا مَثَلًا وَّ نَسِیَ خَلْقَهٗؕ-قَالَ مَنْ یُّحْیِ الْعِظَامَ وَ هِیَ رَمِیْمٌ(۷۸)', 'selected': false},

    {'slideName': 'قُلْ یُحْیِیْهَا الَّذِیْۤ اَنْشَاَهَاۤ اَوَّلَ مَرَّةٍؕ-وَ هُوَ بِكُلِّ خَلْقٍ عَلِیْمُۙﰳ(۷۹)', 'selected': false},

    {'slideName': 'الَّذِیْ جَعَلَ لَكُمْ مِّنَ الشَّجَرِ الْاَخْضَرِ نَارًا فَاِذَاۤ اَنْتُمْ مِّنْهُ تُوْقِدُوْنَ(۸۰)', 'selected': false},

    {'slideName': ' اَوَ لَیْسَ الَّذِیْ خَلَقَ السَّمٰوٰتِ وَالْاَرْضَ  بِقٰدِرٍعَلٰۤى اَنْ یَّخْلُقَ مِثْلَهُمْﳳ-بَلٰىۗ-وَهُوَالْخَلّٰقُ الْعَلِیْمُ(۸۱)', 'selected': false},

    {'slideName': 'اِنَّمَاۤ اَمْرُهٗۤ اِذَاۤ اَرَادَ شَیْــٴًـا اَنْ یَّقُوْلَ لَهٗ كُنْ فَیَكُوْنُ(۸۲)', 'selected': false},

    {'slideName': 'فَسُبْحٰنَ الَّذِیْ بِیَدِهٖ مَلَكُوْتُ كُلِّ شَیْءٍ وَّ اِلَیْهِ تُرْجَعُوْنَ۠(۸۳)', 'selected': false},
  ];
  var selectedSlide;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changeSelector);
    setState(() {
      selectedSlide = allSlides[0];
      selectedSlide['selected'] = true;
    });
  }

  changeSelector() {
    var maxScrollVal = _scrollController.position.maxScrollExtent;

    var divisor = (maxScrollVal / allSlides.length) + 20;

    var scrollValue = _scrollController.offset.round();
    var slideValue = (scrollValue / divisor).round();

    var currentSlide = allSlides.indexWhere((slide) => slide['selected']);

    setState(() {
      allSlides[currentSlide]['selected'] = false;
      selectedSlide = allSlides[slideValue];
      selectedSlide['selected'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
      ),
      body: Row(
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width / 2) * 2,
            child: ListView(
              controller: _scrollController,
              children: allSlides.map((element) {
                return getCards(element);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

Widget getCards(slide) {
  return Padding(
    padding: EdgeInsets.all(1.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.brown,
/*        gradient: LinearGradient(
          colors: [
            Colors.lightGreen,
            Colors.teal,x
            Colors.amber,

          ],
        ),*/
        border:
            Border.all(color: Colors.white, style: BorderStyle.solid, width: 8),
      //  image:DecorationImage(
       // image: AssetImage("images/frame.jpg")),
      ),
      height: 250.0,
      width: double.infinity,
      child: Center(
        child: Text(
          slide['slideName'],
          textAlign: TextAlign.center,
          style: TextStyle(
             color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w800, fontFamily: "Amiri"),
        ),
      ),
    ),
  );
}
