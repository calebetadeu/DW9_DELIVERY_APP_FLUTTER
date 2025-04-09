
import 'package:intl/intl.dart';

extension FormatterExtensions on double {
  String get currencyPTBR{
    final currencyPTBR = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
    );
    return currencyPTBR.format(this);
  }
}