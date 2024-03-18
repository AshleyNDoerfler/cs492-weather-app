import 'package:cs492_weather_app/models/weather_forecast.dart';
import '../../models/user_location.dart';
import 'package:flutter/material.dart';
import '../location/location.dart';

class WeatherScreen extends StatefulWidget {
  final Function getLocation;
  final Function getForecasts;
  final Function getForecastsHourly;
  final Function setLocation;

  const WeatherScreen(
      {super.key,
      required this.getLocation,
      required this.getForecasts,
      required this.getForecastsHourly,
      required this.setLocation});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return (widget.getLocation() != null && widget.getForecasts().isNotEmpty
        ? ForecastWidget(
            context: context,
            location: widget.getLocation(),
            forecasts: widget.getForecastsHourly())
        : LocationWidget(widget: widget));
  }
}

class ForecastWidget extends StatelessWidget {
  final UserLocation location;
  final List<WeatherForecast> forecasts;
  final BuildContext context;

  const ForecastWidget(
      {super.key,
      required this.context,
      required this.location,
      required this.forecasts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocationTextWidget(location: location),
        DescriptionWidget(forecasts: forecasts),
        IconWidget(forecasts: forecasts),
        TemperatureWidget(forecasts: forecasts)
        
      ],
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.forecasts,
  });

  final List<WeatherForecast> forecasts;

  @override
  Widget build(BuildContext context) {
    if (forecasts.elementAt(0).shortForecast.toLowerCase().contains("sunny")) {
      return const SunnyIcon();
    } else if (forecasts.elementAt(0).shortForecast.toLowerCase().contains("cloud")) {
      return const CloudyIcon();
    }else if (forecasts.elementAt(0).shortForecast.toLowerCase().contains("rain")) {
      return const RainyIcon();
    } else if (forecasts.elementAt(0).shortForecast.toLowerCase().contains("snow")) {
      return const SnowIcon();
    } else if (forecasts.elementAt(0).shortForecast.toLowerCase().contains("thunder")) {
      return const ThunderIcon();
    } else {
      return const OtherIcon();
    }
  }
}

class SunnyIcon extends StatelessWidget {
  const SunnyIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 4),
          ),
          child: const Image(
            image: AssetImage('assets/sunny.PNG'),
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}

class CloudyIcon extends StatelessWidget {
  const CloudyIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 4),
          ),
          child: const Image(
            image: AssetImage('assets/cloudy.PNG'),
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}

class RainyIcon extends StatelessWidget {
  const RainyIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 4),
          ),
          child: const Image(
            image: AssetImage('assets/rain.PNG'),
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}

class SnowIcon extends StatelessWidget {
  const SnowIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 4),
          ),
          child: const Image(
            image: AssetImage('assets/snow.PNG'),
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}

class ThunderIcon extends StatelessWidget {
  const ThunderIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 4),
          ),
          child: const Image(
            image: AssetImage('assets/thunder.PNG'),
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}

class OtherIcon extends StatelessWidget {
  const OtherIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      width: 100,
      child: Center(
        child: Image(
          image: AssetImage('assets/other.PNG'),
          width: 200,
          height:200)
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.forecasts,
  });

  final List<WeatherForecast> forecasts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 500,
      child: Center(
          child: Text(forecasts.elementAt(0).shortForecast,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      )
    );
  }
}

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({
    super.key,
    required this.forecasts,
  });

  final List<WeatherForecast> forecasts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 90,
      child: Center(
        child: Center(
          child: Text('${forecasts.elementAt(0).temperature}º',
              style: Theme.of(context).textTheme.displayLarge),
        ),
      ),
    );
  }
}

class LocationTextWidget extends StatelessWidget {
  const LocationTextWidget({
    super.key,
    required this.location,
  });

  final UserLocation location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 500,
        height: 40,
        child: Center(
          child: Text("${location.city}, ${location.state}, ${location.zip}",
              style: Theme.of(context).textTheme.headlineSmall),
        ),
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.widget,
  });

  final WeatherScreen widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Requires a location to begin"),
          ),
          Location(
              setLocation: widget.setLocation,
              getLocation: widget.getLocation),
        ],
      ),
    );
  }
}
