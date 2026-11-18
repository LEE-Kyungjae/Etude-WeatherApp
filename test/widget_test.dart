import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lecture/model/model.dart';

void main() {
  final model = Model();

  group('getWeatherIcon', () {
    // OpenWeather condition codes: 2xx thunderstorm, 3xx drizzle, 5xx rain,
    // 6xx snow, 7xx atmosphere, 800 clear, 80x clouds.
    const expected = {
      200: 'svg/climacon-cloud_lightning.svg',
      232: 'svg/climacon-cloud_lightning.svg',
      300: 'svg/climacon-cloud_rain.svg',
      500: 'svg/climacon-cloud_rain.svg',
      600: 'svg/climacon-cloud_snow_alt.svg',
      622: 'svg/climacon-cloud_snow_alt.svg',
      701: 'svg/climacon-cloud_sun.svg',
      781: 'svg/climacon-cloud_sun.svg',
      800: 'svg/climacon-sun.svg',
      801: 'svg/climacon-cloud_sun.svg',
      804: 'svg/climacon-cloud_sun.svg',
    };

    expected.forEach((condition, asset) {
      test('condition $condition uses an existing asset ($asset)', () {
        final icon = model.getWeatherIcon(condition) as SvgPicture;
        final provider = icon.pictureProvider as ExactAssetPicture;
        expect(provider.assetName, asset);
        expect(File(asset).existsSync(), isTrue);
      });
    });
  });

  group('air quality', () {
    for (var index = 1; index <= 5; index++) {
      test('AQI $index has an existing icon and a label', () {
        final icon = model.getAirIcon(index) as Image;
        final asset = (icon.image as AssetImage).assetName;
        expect(File(asset).existsSync(), isTrue);
        expect(model.getAirCondition(index), isA<Text>());
      });
    }

    test('unknown AQI still returns widgets', () {
      expect(model.getAirIcon(0), isNotNull);
      expect(model.getAirCondition(0), isNotNull);
    });
  });
}
