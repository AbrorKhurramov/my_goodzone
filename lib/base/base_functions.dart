// ignore: import_of_legacy_library_into_null_safe
//import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:my_goodzone/data/data_source/local_source.dart';
import 'package:my_goodzone/data/models/token/refresh_token_request.dart';
import 'package:my_goodzone/data/models/token/refresh_token_response.dart';

class BaseFunctions {
  static String numberWithZero(String number) {
    if (number.substring(0, 1) == '0')
      return number;
    else if (number.length == 1) return "0$number";
    return number;
  }

  static String moneyFormatWithSymbol(double sum) {
    var amount = sum.toString();
    //     FlutterMoneyFormatter(
    //   amount: sum,
    //   settings: MoneyFormatterSettings(thousandSeparator: " "),
    // ).output.symbolOnLeft;
    return amount.substring(0, amount.length - 3);
  }

  static String moneyFormat(double sum) {
    var amount = sum.toString();
     //     FlutterMoneyFormatter(
    //   amount: sum,
    //   settings: MoneyFormatterSettings(thousandSeparator: " "),
    // ).output.withoutFractionDigits;
    return amount.replaceAll('.00', '');
  }

  static Future<void> refreshToken() async {
    var request = RefreshTokenRequest(
      refreshToken: LocalSource.getInstance().getRefreshToken(),
    );
//    final refreshTokenRepository = RefreshTokenRepository();
//     final result = await refreshTokenRepository.refreshToken(request: request);
//     if (result is RefreshTokenResponse) {
//       LocalSource.getInstance().setRefreshedTokens(
//         refreshToken: result.refreshToken,
//         accessToken: result.accessToken,
//       );
//     }
  }

// static String getStringByLanguage(Title value) {
//   var lang = GetStorage().read<String>('locale') ?? 'ru';
//   if (lang == 'ru') {
//     return value?.ru ?? '';
//   } else if (lang == 'en') {
//     return value?.en ?? '';
//   } else {
//     return value?.uz ?? '';
//   }
// }
}
