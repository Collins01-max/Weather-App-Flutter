import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/ViewModels/base_model.dart';
import 'package:weather_app/locator.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelready;
  final Function(T) onModelDisposed;
  BaseView({
    this.builder,
    this.onModelready,
    this.onModelDisposed,
  });
  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();
  @override
  void initState() {
    if (widget.onModelready != null) {
      widget.onModelready(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onModelDisposed != null) widget.onModelDisposed(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
