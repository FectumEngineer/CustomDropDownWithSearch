library drop_down_with_search;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownWithSearch extends StatefulWidget {
  final List<String> inputItem;
  final String hint;
  final TextEditingController textController;
  final String noSearchItemText;
  final Color selectedItemBackgroundColor;
  final TextStyle dropDownTextStyle;
  final TextStyle noItemTextStyle;
  final TextStyle hintStyle;
  final Icon suffixIconDown;
  final Icon suffixIconUp;
  const DropDownWithSearch(
      {Key? key,
      required this.inputItem,
      this.hint = "hint",
      required this.textController,
      this.noSearchItemText = "No search item",
      this.selectedItemBackgroundColor = Colors.black12,
      this.dropDownTextStyle = const TextStyle(
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        color: Color(0xFF878787),
      ),
      this.noItemTextStyle = const TextStyle(
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        color: Color(0xFF878787),
      ),
      this.hintStyle = const TextStyle(
        color: Color(0xFF878787),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      this.suffixIconDown = const Icon(
        Icons.keyboard_arrow_down,
        color: Colors.pink,
        size: 24.0,
      ),
      this.suffixIconUp = const Icon(
        Icons.keyboard_arrow_up,
        color: Colors.pink,
        size: 24.0,
      )})
      : super(key: key);

  @override
  State<DropDownWithSearch> createState() => _DropDownWithSearchState();
}

class _DropDownWithSearchState extends State<DropDownWithSearch> {
  late List<String> filtered = [];
  bool isData = true;
  String selected = " ";
  bool isExpanded = false;

  @override
  void initState() {
    // TODO: implement initState
    filtered.addAll(widget.inputItem);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(isData, filtered.length + 1, 224).toDouble(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(const Radius.circular(8.0)),
        border: Border.all(
            color: Color(0xFF8BB4FF), width: 1.0, style: BorderStyle.solid),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              enabled: true,
              controller: widget.textController,
              textInputAction: TextInputAction.done,
              onChanged: filterValue,
              scrollPadding: EdgeInsets.only(bottom: 100.00),
              decoration: InputDecoration(
                suffixIcon: getIcon(isExpanded),
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide:
                      const BorderSide(color: Color(0xFFD5D4DC), width: 1),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE31F26), width: 1),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD5D4DC), width: 1),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFE31F26),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide:
                      const BorderSide(color: Color(0xFFD5D4DC), width: 1),
                ),
                hintText: widget.hint,
                hintStyle: widget.hintStyle,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 12.0,
                ),
              ),
            ),
            if (isExpanded)
              isData
                  ? Column(
                      children: filtered.map((value) {
                        return InkWell(
                            onTap: () {
                              widget.textController.text = value;
                              selected = value;
                              widget.textController.selection =
                                  TextSelection.fromPosition(
                                      TextPosition(offset: value.length));
                              setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40.0,
                              color: selected == value
                                  ? widget.selectedItemBackgroundColor
                                  : Colors.white,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    value,
                                    textAlign: TextAlign.left,
                                    style: widget.dropDownTextStyle,
                                  ),
                                ),
                              ),
                            ));
                      }).toList(),
                    )
                  : Container(
                      height: 40.0,
                      child: Center(
                        child: Text(
                          widget.noSearchItemText,
                          style: widget.noItemTextStyle,
                        ),
                      ),
                    ),
          ],
        ),
      ),
    );
  }

  filterValue(value) {
    widget.textController.text = value;
    widget.textController.selection =
        TextSelection.fromPosition(TextPosition(offset: value.length));
    filtered.clear();
    if (value.length > 0) {
      for (var item in widget.inputItem) {
        if (item.contains(value)) {
          filtered.add(item);
        }
      }
      filtered.isNotEmpty ? isData = true : isData = false;
    } else {
      filtered.addAll(widget.inputItem);
      isData = true;
    }
    setState(() {});
  }

  getHeight(isNodata, filterLength, value) {
    return isExpanded
        ? !isNodata
            ? value / 2
            : filterLength * 48.0 > value
                ? value
                : filterLength * 48
        : 50;
  }

  getIcon(bool isExpanded) {
    return isExpanded
        ? InkWell(
            onTap: () {
              setExpansion(false);
            },
            child: widget.suffixIconUp,
          )
        : InkWell(
            onTap: () {
              setExpansion(true);
            },
            child: widget.suffixIconDown,
          );
  }

  setExpansion(value) {
    isExpanded = value;
    setState(() {});
  }
}
