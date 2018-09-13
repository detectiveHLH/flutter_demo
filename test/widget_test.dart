import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main () {
  testWidgets('My first widget test', (WidgetTester tester) async {
    var sliderKey = new UniqueKey();
    var value = 0.0;

    await tester.pumpWidget(
      new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                child: new Center(
                  child: new Slider(
                    key: sliderKey,
                    value: value,
                    onChanged: (double newValue) {
                      setState (() {
                        value = newValue;
                      });
                    },
                  ),
                ),
              ),
            );
          }
      )
    );
    expect(value, equals(0.0));

    await tester.tap(find.byKey(sliderKey));

    expect(value, equals(0.5));
  });
}