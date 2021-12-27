import 'package:flutter/material.dart';

void main() => runApp(const TextFieldApp());

class TextFieldApp extends StatelessWidget {
  const TextFieldApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: TextFieldCustomForm(),
    );
  }
}

// Define a custom Form widget.
class TextFieldCustomForm extends StatefulWidget {
  const TextFieldCustomForm({Key? key}) : super(key: key);

  @override
  _TextFieldCustomFormState createState() => _TextFieldCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _TextFieldCustomFormState extends State<TextFieldCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                print('First text field: $text');
              },
            ),
            TextField(
              controller: myController,
            ),
          ],
        ),
      ),
    );
  }
}
