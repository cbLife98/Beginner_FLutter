import 'package:crypto_app/data/crypto_data.dart';

class MockCryptoRepository implements CryptoRepository{
  @override
  Future<List<Crypto>> fetchCurrencies() {

    return Future.value(currencies);
  }

  var currencies = <Crypto>[
    new Crypto(name: "Bitcoin",price_usd: "800.87",percent_change_1h: "-0.7"),
    new Crypto(name: "Ethereum",price_usd: "650.09",percent_change_1h: "0.85"),
    new Crypto(name: "Ripple",price_usd: "280.67",percent_change_1h: "0.25"),

  ];

}