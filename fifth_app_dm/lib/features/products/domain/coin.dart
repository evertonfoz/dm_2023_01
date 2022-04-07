class Coin {
  final String code;
  final String symbol;
  final String rate;
  final String description;
  final double rate_float;

  Coin({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rate_float,
  });
}
// "USD":{"code":"USD",
//       "symbol":"&#36;",
//       "rate":"43,805.5400",
//       "description":"United States Dollar",
//       "rate_float":43805.54
// }

// {
//   "time":{
//     "updated":"Apr 7, 2022 12:30:00 UTC",
//     "updatedISO":"2022-04-07T12:30:00+00:00",
//     "updateduk":"Apr 7, 2022 at 13:30 BST"
//     },
//     "disclaimer":"This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org",
//     "chartName":"Bitcoin",
//     "bpi":{
//       "USD":{"code":"USD",
//       "symbol":"&#36;",
//       "rate":"43,805.5400",
//       "description":"United States Dollar",
//       "rate_float":43805.54
//       },
//       "GBP":{"code":"GBP","symbol":"&pound;","rate":"33,486.5756","description":"British Pound Sterling","rate_float":33486.5756},"EUR":{"code":"EUR","symbol":"&euro;","rate":"40,146.8137","description":"Euro","rate_float":40146.8137}}}