enum PriceRangeEnum {
  none(minValue: 0, maxValue: double.infinity),
  below_999(minValue: 0, maxValue: 999),
  price_999_to_9999(minValue: 1000, maxValue: 9999),
  price_9999_to_99999(minValue: 10000, maxValue: 99999),
  price_99999_to_999999(minValue: 100000, maxValue: 999999),
  more_than_1000000(minValue: 1000000, maxValue: double.infinity);

  final double minValue;
  final double maxValue;

  const PriceRangeEnum({
    required this.minValue,
    required this.maxValue,
  });
}
