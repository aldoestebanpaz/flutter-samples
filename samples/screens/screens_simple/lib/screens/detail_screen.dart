import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController subtitleController;
  final TextEditingController labelController;
  final Map<String, dynamic> data;

  DetailScreen(this.data)
    : titleController = TextEditingController(text: data['title']),
    subtitleController = TextEditingController(text: data['subtitle']),
    labelController = TextEditingController(text: data['avatar_number']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details: ${data['id']}'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) =>
              ['Go Back'].map((item) =>
                PopupMenuItem<String>(
                  value: item,
                  child: Text(item)
                )
              ).toList(),
            onSelected: (_) => Navigator.pop(context, 'You\'ve selected the option inside the popup menu'),
          )
        ]
      ),
      body: generateBody(context)
    );
  }

  Widget generateBody(BuildContext context) {
    TextStyle? textFieldsTextStyle = Theme.of(context).textTheme.headline6;

    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          TextField(
            controller: titleController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
              )
            ),
            style: textFieldsTextStyle
          ),
          SizedBox(height: 10,),
          TextField(
            controller: subtitleController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Subtitle',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
              )
            ),
            style: textFieldsTextStyle,
          ),
          SizedBox(height: 10,),
          TextField(
            controller: labelController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Label',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
              )
            ),
            style: textFieldsTextStyle,
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              (ModalRoute.of(context)?.canPop ?? false) ?
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, 'You\'ve pressed the button'),
                  child: Text('Go back!'),
                )
              : SizedBox(),
              // (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : SizedBox()
            ],
          )
        ],
      ),
    );
  }
}
