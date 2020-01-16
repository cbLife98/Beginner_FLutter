import 'package:crypto_app/data/crypto_data.dart';
import 'package:crypto_app/modules/crypto_presenter.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  implements CryptoListViewContract{
CryptoListPresenter _presenter;

List<Crypto> _currencies;
bool _isLoading ;
  final List<MaterialColor> _colors  = [Colors.blue,Colors.indigo,Colors.red];

_HomePageState(){
  _presenter = new CryptoListPresenter(this);
}

@override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Crypto App"),

      ),
      body: _isLoading ? new Center(child: CircularProgressIndicator(),): _cryptoWidget() ,
    );
  }


  Widget _cryptoWidget(){
    return new Container(
      child: Column(
        children: <Widget>[
          new Flexible(
              child: new ListView.builder(
                itemCount: _currencies.length,
                  itemBuilder: (BuildContext context, int index){
                  final Crypto currency  = _currencies[index];
                  final MaterialColor color = _colors[index % _colors.length];
                  return _getListItemUI(currency,color);
                  }
              )
          ),
        ],
      ),
    );
  }


  ListTile _getListItemUI(Crypto currency,MaterialColor color){
    return new ListTile(
  leading: new CircleAvatar(
    backgroundColor: color,
    child: new Text(currency.name),
  ),
      title: new Text(currency.name,style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: _getSubtitleText(currency.price_usd,currency.percent_change_1h),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUSD,String percentageChange){
    TextSpan priceTextWidget = new TextSpan(text: "\$$priceUSD\n",style: new TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour: $percentageChange%";
    TextSpan percentageChangeTextWidget;
    if(double.parse(percentageChange) > 0 ){
      percentageChangeTextWidget =  new TextSpan(text: percentageChangeText,style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget =  new TextSpan(text: percentageChangeText,style: new TextStyle(color: Colors.red));

    }
     return new RichText(text: new TextSpan(
       children: [priceTextWidget,percentageChangeTextWidget]
     ) );
  }

  @override
  void onLoadComplete(List<Crypto> items) {
    setState(() {
      _currencies = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadCryptoError() {
    // TODO: implement onLoadCryptoError
  }
}
