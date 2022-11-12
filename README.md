<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This Custom drop down will have the Custom feature of drop down and search.

## Features
A custom drop with search on list .

![Blink](https://github.com/FectumEngineer/CustomDropDownWithSearch/blob/main/assets/demo.gif)

## Getting started

This package supports null safety.Please use this package with flutter that supports null safety.

## Usage

```
DropDownWithSearch(
          textController: myController,
          inputItem: ["Mumbai", "Chennai", "Maharastra", "Karnataka"],
        ),

```

## Example

```
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: DropDownWithSearch(
          textController: myController,
          inputItem: ["Mumbai", "Chennai", "Maharastra", "Karnataka"],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

```

## Additional information
Changes to the package is always accepted.Please send PR with changes.