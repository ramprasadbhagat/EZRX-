import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_data.freezed.dart';

@freezed
class CountryData with _$CountryData {
  const CountryData._();
  factory CountryData({
    required String country,
    required String countryName,
  }) = _CountryData;

  factory CountryData.empty() => CountryData(
        country: '',
        countryName: '',
      );
}
