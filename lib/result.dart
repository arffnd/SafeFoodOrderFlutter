import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

_sendingMails() async {
const url = 'mailto:arkoofficial750@gmail.com';
if (await canLaunch(url)) {
await launch(url);
} else {
throw 'Could not launch $url';
}
}

_sendingSMS() async {
const url = 'sms:8240251866';
if (await canLaunch(url)) {
await launch(url);
} else {
throw 'Could not launch $url';
}
}

class Result extends StatelessWidget {
final int resultScore;
final Function resetHandler;

Result(this.resultScore, this.resetHandler);

//Remark Logic
String get resultPhrase {
String resultText = "Thanks for Order";

return resultText;
}

@override
Widget build(BuildContext context) {
return Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Text(
resultPhrase,
style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
textAlign: TextAlign.center,
), //Text
Text(
'Copy the Code: ' '$resultScore',
style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
textAlign: TextAlign.center,
), //Text
Text(
'Mail the code to complete your order',
style: TextStyle(
fontSize: 18.0,
color: Colors.green,
//fontWeight: FontWeight.bold,
),
),
Container(
height: 10.0,
),
RaisedButton(
onPressed: _sendingMails,
child: Text('Here'),
textColor: Colors.black,
padding: const EdgeInsets.all(5.0),
),
Container(
height: 20.0,
),
Text(
'Or Send SMS',
style: TextStyle(
fontSize: 18.0,
color: Colors.green,
//fontWeight: FontWeight.bold,
),
),
Container(
height: 10.0,
),
RaisedButton(
onPressed: _sendingSMS,
child: Text('Here'),
textColor: Colors.black,
padding: const EdgeInsets.all(5.0),
),
FlatButton(
child: Text(
'Order Again!',
), //Text
textColor: Colors.blue,
onPressed: resetHandler,
), //FlatButton
], //<Widget>[]
), //Column
); //Center
}
}