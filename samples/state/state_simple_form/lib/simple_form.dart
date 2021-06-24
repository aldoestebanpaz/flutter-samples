import 'package:flutter/material.dart';

class SimpleForm extends StatefulWidget {
  const SimpleForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SimpleFormState();
}

class _SimpleFormState extends State<SimpleForm> {
  static const _dropdownValues = <String>['ARS', 'USD', 'USDT', 'BTC', 'ETH'];
  late String _dropdownValue = _dropdownValues[0];
  String _result = '';
  late TextEditingController _previousAmountController;
  late TextEditingController _newAmountController;
  late TextEditingController _detailsController;

  @override
  void initState() {
    super.initState();
    _previousAmountController = new TextEditingController();
    _newAmountController = new TextEditingController();
    _detailsController = new TextEditingController();
  }

  @override
  void dispose() {
    _previousAmountController.dispose();
    _newAmountController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    TextStyle? textFieldsTextStyle = Theme.of(context).textTheme.headline6;

    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _previousAmountController,
            decoration: InputDecoration(
              labelText: 'Previous amount',
              hintText: 'e.g. 200',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
              )
            ),
            style: textFieldsTextStyle,
            keyboardType: TextInputType.number,
            onSubmitted: (String value) => showDialogBox(),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: _newAmountController,
            decoration: InputDecoration(
              labelText: 'New amount',
              hintText: 'e.g. 200',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
              )
            ),
            style: textFieldsTextStyle,
            keyboardType: TextInputType.number,
            onSubmitted: (String value) => showDialogBox(),
          ),
          SizedBox(height: 10,),
          DropdownButton<String>(
            value: _dropdownValue,
            items: _dropdownValues.map<DropdownMenuItem<String>>((String value) =>
              DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              )
            ).toList(),
            isExpanded: true,
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                _dropdownValue = newValue!;
              });
            },
          ),
          SizedBox(height: 10,),
          TextField(
            controller: _detailsController,
            decoration: InputDecoration(
              labelText: 'Details',
              hintText: 'e.g. amount used to paid taxes'
            ),
            onSubmitted: (String value) => showDialogBox(),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(child: ElevatedButton(
                onPressed: () => calculateResult(),
                child: Text('Show result')
              )),
              SizedBox(width: 5),
              Expanded(child: ElevatedButton(
                onPressed: () {
                  _previousAmountController.text = '';
                  _newAmountController.text = '';
                  _detailsController.text = '';
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey
                ),
                child: Text('Reset', style:  TextStyle(color: Theme.of(context).primaryColorLight))
              )),
            ],
          ),
          SizedBox(height: 10),
          Text(_result)
        ],
      ),
    );
  }

  void calculateResult() {
    double previousAmount = double.parse(_previousAmountController.text);
    double newAmount = double.parse(_newAmountController.text);
    String result = 'Sum ${previousAmount + newAmount} in $_dropdownValue\nDetails: ${_detailsController.text}';

    setState(() {
      _result = result;
    });
  }

  void showDialogBox() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thanks!'),
          content: Text('You have pressed <ENTER> inside the TextField'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
