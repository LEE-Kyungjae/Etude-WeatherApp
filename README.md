# WeatherApp

This is a simple weather app developed using Flutter, inspired by the YouTube tutorial from "Coding Chef."

## Features

- Fetches weather information via API using GPS.
- Displays real-time temperature and weather conditions.

## Technologies Used

- **Flutter**: Cross-platform framework.
- **OpenWeather API**: For weather data.
- **GPS**: Location-based weather updates.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/LEE-Kyungjae/Etude-WeatherApp.git
   cd Etude-WeatherApp
   ```
2. Install dependencies (the app predates null safety, so use Flutter 2.x, e.g. 2.10.5):
   ```bash
   flutter pub get
   ```
3. Get a free API key from [OpenWeather](https://home.openweathermap.org/api_keys) and pass it at build time:
   ```bash
   flutter run --dart-define=OPENWEATHER_API_KEY=<your key>
   ```
