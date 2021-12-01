import 'package:flashcard/infrastructure/models/response_stream.dart';
import 'package:flashcard/ui_style_guides/my_colors/my_colors.dart';
import 'package:flashcard/ui_style_guides/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingStreamResolver<T> extends StatelessWidget {
  final ResponseStream<T> stream;
  final Widget Function(T data) onSuccess;
  final Widget onError;

  const LoadingStreamResolver(
      {Key? key,
      required this.stream,
      required this.onSuccess,
      required this.onError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return stream.toBuild(
        onSuccess: onSuccess,
        onLoading: _buildLoadingScreen(),
        onError: onError);
  }

  Widget _buildLoadingScreen() {
    return Loader();
  }
}
