[![Dart](https://github.com/noskap/riverpod_hover_consumer/actions/workflows/dart.yml/badge.svg)](https://github.com/noskap/riverpod_hover_consumer/actions/workflows/dart.yml)
# Riverpod Hover Consumer

A Flutter package that provides a widget that can react to mouse hover events using Riverpod state management.
This package was designed with riverpod in mind, but it should drop in and work with any
state management solution.

## Features

- **RiverpodHoverConsumer**: A widget that extends the ConsumerWidget class and accepts a builder function that returns a widget based on the hover state. It also accepts an optional onTap function that can perform actions when the widget is tapped.
- **isHoveringProvider**: A state provider that holds a boolean value indicating whether the mouse is hovering over the widget or not. It can be accessed by the builder and onTap functions using the WidgetRef parameter.

## Usage

To use this package, add `riverpod_hover_consumer` as a dependency in your `pubspec.yaml` file. Then, import it in your Dart code:

```dart 
import 'package:riverpod_hover_consumer/riverpod_hover_consumer.dart';
```

You can use the RiverpodHoverConsumer widget anywhere in your widget tree, as long as it is under a ProviderScope. For example:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: RiverpodHoverConsumer(
              builder: (context, ref, isHovering) {
                return Text(
                  isHovering ? 'Hello, World!' : 'Hover over me',
                  style: TextStyle(fontSize: 32),
                );
              },
              onTap: (context, ref, isHovering) {
                print('You tapped me');
              },
            ),
          ),
        ),
      ),
    );
  }
}
```

This will create a text widget that changes its content when the mouse hovers over it, and prints a message when it is tapped.

## Dependencies

This package depends on the following packages:

- `flutter`
- `flutter_riverpod`

## License

This package is licensed under the MIT license. See the [LICENSE](^1^) file for more details.