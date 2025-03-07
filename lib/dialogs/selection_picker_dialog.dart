// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/pickers/selection_picker.dart';

import '../flutter_material_pickers.dart';
import '../interfaces/common_dialog_properties.dart';
import 'responsive_dialog.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class SelectionPickerDialog<T> extends StatefulWidget
    implements ICommonDialogProperties {
  SelectionPickerDialog({
    this.title,
    required this.items,
    required this.selectedItem,
    this.transformer,
    this.iconizer,
    this.headerColor,
    this.headerTextColor,
    this.backgroundColor,
    this.buttonTextColor,
    this.maxLongSide,
    this.maxShortSide,
    this.confirmText,
    this.cancelText,
  });

  final List<T> items;
  final T selectedItem;
  final Transformer<T>? transformer;
  final Iconizer<T>? iconizer;
  @override
  final String? title;
  @override
  final Color? headerColor;
  @override
  final Color? headerTextColor;
  @override
  final Color? backgroundColor;
  @override
  final Color? buttonTextColor;
  @override
  final double? maxLongSide;
  @override
  final double? maxShortSide;
  @override
  final String? confirmText;
  @override
  final String? cancelText;

  @override
  State<SelectionPickerDialog> createState() =>
      _SelectionPickerDialogState<T>(selectedItem);
}

class _SelectionPickerDialogState<T> extends State<SelectionPickerDialog<T>> {
  _SelectionPickerDialogState(this.selectedItem);

  T selectedItem;

  @override
  Widget build(BuildContext context) {
    return ResponsiveDialog(
      context: context,
      title: widget.title,
      headerColor: widget.headerColor,
      headerTextColor: widget.headerTextColor,
      backgroundColor: widget.backgroundColor,
      buttonTextColor: widget.buttonTextColor,
      maxLongSide: widget.maxLongSide,
      maxShortSide: widget.maxLongSide,
      confirmText: widget.confirmText,
      cancelText: widget.cancelText,
      child: SelectionPicker<T>(
        items: widget.items,
        initialValue: selectedItem,
        onChanged: (item) => setState(() => selectedItem = item),
        transformer: widget.transformer,
        iconizer: widget.iconizer,
      ),
      okPressed: () => Navigator.of(context).pop(selectedItem),
    );
  }
}
