import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/weatherModel.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Wheather Page"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey,
                Colors.blueGrey.shade200,
              ],
            ),
          ),
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SpecialWidget1(),
                      SpecialWidget2(),
                      ChangeTempButton()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChangeTempButton extends StatelessWidget {
  const ChangeTempButton({Key key}) : super(key: key);

  Color decideColor(WeatherModel model) {
    return model.temperatureType == "celcius"
        ? Colors.red
        : Colors.blue.shade800;
  }

  @override
  Widget build(BuildContext context) {
    var weatherModel = Provider.of<WeatherModel>(context);

    onPressed() {
      String newTempType =
          weatherModel.temperatureType == "celcius" ? "fahrenheit" : "celcius";

      weatherModel.temperatureVal = weatherModel.temperatureType == "celcius"
          ? (weatherModel.temperatureVal * 9 / 5) + 32
          : (weatherModel.temperatureVal - 32) / (9 / 5);
      weatherModel.temperatureType = newTempType;
    }

    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: decideColor(weatherModel),
            onPrimary: Colors.grey.shade900,
            elevation: 5),
        child: Text(
          "Change Type",
          style: TextStyle(color: Colors.white),
        ));
  }
}

class SpecialWidget1 extends StatelessWidget {
  const SpecialWidget1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weatherModel = Provider.of<WeatherModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Temperature",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(weatherModel.temperatureVal.toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
      ],
    );
  }
}

class SpecialWidget2 extends StatelessWidget {
  const SpecialWidget2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherModel>(builder: (context, weatherModel, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Unit",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(weatherModel.temperatureType,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
        ],
      );
    });
  }
}
