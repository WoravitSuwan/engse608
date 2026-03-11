import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../models/province_model.dart';
import '../models/weather_forecast_model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WeatherProvider>(context, listen: false).fetchWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffe8ecff),
            Color(0xffffffff),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Thailand Weather'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                Provider.of<WeatherProvider>(
                  context,
                  listen: false,
                ).fetchWeather();
              },
            ),
          ],
        ),
        body: Consumer<WeatherProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [

                /// Province Selector
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButton<Province>(
                        underline: const SizedBox(),
                        isExpanded: true,
                        value: provider.selectedProvince,
                        onChanged: (Province? newValue) {
                          if (newValue != null) {
                            provider.changeProvince(newValue);
                          }
                        },
                        items: provinces.map((Province province) {
                          return DropdownMenuItem(
                            value: province,
                            child: Text(
                              province.name,
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                /// Toggle Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ToggleButtons(
                    isSelected: [
                      provider.showCurrentWeather,
                      !provider.showCurrentWeather,
                    ],
                    onPressed: (int index) {
                      provider.toggleViewMode(index == 0);
                    },
                    borderRadius: BorderRadius.circular(12),
                    selectedColor: Colors.white,
                    fillColor: Colors.indigo,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Text('Current'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Text('10-Day Forecast'),
                      ),
                    ],
                  ),
                ),

                const Divider(),

                Expanded(child: _buildContent(provider)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(WeatherProvider provider) {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(child: Text('Error: ${provider.error}'));
    }

    if (provider.weather == null) {
      return const Center(child: Text('No data available'));
    }

    if (provider.showCurrentWeather) {
      return _buildCurrentWeather(provider.weather!.current);
    } else {
      return _buildDailyForecast(provider.weather!.daily);
    }
  }

  /// CURRENT WEATHER CARD
  Widget _buildCurrentWeather(Current? current) {
    if (current == null) {
      return const Center(child: Text('Current weather data unavailable'));
    }

    return Center(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.wb_sunny,
                size: 70,
                color: Colors.orange,
              ),
              const SizedBox(height: 15),
              const Text(
                'Temperature',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${current.temperature2m}°C',
                style: const TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Weather Code: ${current.weatherCode}',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// FORECAST LIST
  Widget _buildDailyForecast(Daily? daily) {
    if (daily == null) {
      return const Center(child: Text('Forecast data unavailable'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: daily.time.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            leading: const Icon(
              Icons.calendar_today,
              color: Colors.indigo,
            ),
            title: Text(
              daily.time[index],
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'Max: ${daily.temperature2mMax[index]}°C  |  Min: ${daily.temperature2mMin[index]}°C',
            ),
            trailing: Text(
              'Code: ${daily.weatherCode[index]}',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        );
      },
    );
  }
}