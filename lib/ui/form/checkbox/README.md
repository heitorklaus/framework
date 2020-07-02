# CheckBox

This is a customized Checkbox using Vek draw pattern.

## Example of use:

```dart
class TemporaryPage extends StatelessWidget {
  const TemporaryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckBox ck = CheckBox(
      text: 'CheckBox example',
      onChanged: (value) {
        // You can implement this callback function to get the state of checkbox
        print('Do something : ' + value.toString());
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ck,
            FlatButton(
              child: Text('LET\'S TEST'),
              onPressed: () {
                // You can get the state of checkbox using its attribute:
                print(ck.checked ? 'OK' : "NOK");
              },
            )
          ],
        ),
      ),
    );
  }
}
```

*Note that name is "CheckBox" no "Checkbox". "Checkbox" is a flutter widget*