import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

typedef void OnTapCallback(String value);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget with AutoCompleteTextInterface  {
  final TextEditingController controller;

  final onTapCallback;
  final int suggestionsApiFetchDelay;
  final Function getSuggestionsMethod;
  final tfTextDecoration;
  final tfStyle;
  final tfCursorColor;
  final tfCursorWidth;
  final tfTextAlign;

   List<String> suggestionShowList = List<String>();

  MyHomePage(
  {
    @required this.controller,
    this.onTapCallback,
    this.suggestionsApiFetchDelay = 0,
    @required this.getSuggestionsMethod,
    this.tfTextDecoration = const InputDecoration(), 
    this.tfStyle = const TextStyle(color: Colors.black),
    this.tfCursorColor = Colors.white,
    this.tfCursorWidth = 2.0,
    this.tfTextAlign = TextAlign.left,
  });

  @override
  _MyHomePageState createState() => _MyHomePageState();

  //This funciton is called when a user clicks on a suggestion
  @override
  void onTappedSuggestion(String suggestion) {
    onTapCallback(suggestion);
  }

}

class _MyHomePageState extends State<MyHomePage> {

  ScrollController scrollController = ScrollController();
  LayerLink _layerLink = LayerLink();
  Timer _debounce;
  bool isSearching = true;
  final suggestionsStreamController = new BehaviorSubject<List<String>>();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

     widget.controller.addListener(_onSearchChanged);
  }

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce =
        Timer(Duration(milliseconds: widget.suggestionsApiFetchDelay), () {
      if (isSearching == true) {
        _getSuggestions(widget.controller.text);
      }
    });
  }

  _getSuggestions(String data) async {
    if (data.length > 0 && data != null) {
      List<String> list = await widget.getSuggestionsMethod(data);
      suggestionsStreamController.sink.add(list);
    }
  }

 OverlayEntry _createOverlayEntry() {
   RenderBox renderBox = context.findRenderObject();
   var size = renderBox.size;
   return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: this._layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            child: StreamBuilder<Object>(
              stream: suggestionsStreamController.stream,
              builder: (context, suggestionData) {
                if (suggestionData.hasData && widget.controller.text.isNotEmpty) {
                  suggestionShowList = [suggestionData.data];
                }
              }
            )
          )
        )
      )
   );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: this._layerLink,
      child: TextField(
        decoration: widget.tfTextDecoration,
        style: widget.tfStyle,
        cursorColor: widget.tfCursorColor,
        cursorWidth: widget.tfCursorWidth,
        textAlign: widget.tfTextAlign,
        focusNode: this._focusNode,
      )
    );
  }

  @override
  void dispose() {
    suggestionsStreamController.close();
    scrollController.dispose();
    widget.controller.dispose();
    super.dispose();
  }

}////

abstract class AutoCompleteTextInterface {
  void onTappedSuggestion(String suggestion);
}