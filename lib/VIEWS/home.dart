import 'package:currency_converter/components/usdToany.dart';
import 'package:currency_converter/functions/fetchData.dart';
import 'package:currency_converter/model/rates.dart';
import 'package:currency_converter/utils/Mycolors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // initial Variable
  late Future<RatesModel> result;
  late Future<Map> allCurrencies;
  final formKey = GlobalKey<FormState>();
  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      result = fetchrates();
      allCurrencies = fetchCurryncy();
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Mycolors.lEXT_PRIMARY,
        height: h,
        width: w,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: FutureBuilder<RatesModel>(
                future: result,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Center(
                      child: FutureBuilder<Map>(
                    future: allCurrencies,
                    builder: (context, currentsnapsot) {
                      if (currentsnapsot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Column(
                        children: [
                          UsdToAny(
                            rates: snapshot.data!,
                            currencies: snapshot.data!.rates,
                          ),
                        ],
                      );
                    },
                  ));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
