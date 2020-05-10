import 'package:flutter_money_formatter/flutter_money_formatter.dart';

String formatIDR(int n) {
  MoneyFormatterOutput fo = FlutterMoneyFormatter(
          amount: n.toDouble(),
          settings: MoneyFormatterSettings(
              symbol: 'IDR',
              thousandSeparator: '.',
              decimalSeparator: ',',
              symbolAndNumberSeparator: ' ',
              fractionDigits: 0,
              compactFormatType: CompactFormatType.short))
      .output;
  return fo.symbolOnLeft.toString();
}
