import 'dart:async';
import 'package:fitbro/helpers/loading/loading_screen_controller.dart';
import 'package:flutter/material.dart';

/// Loading Screen will be displayed if necessary between operations.
class LoadingScreen {
  /// Singleton instance.
  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  LoadingScreen._sharedInstance();
  factory LoadingScreen() => _shared;

  LoadingScreenController? controller;

  /// Show the Loading Screen.
  void show({required BuildContext context, required String text}) {
    if (controller?.update(text) ?? false) {
      return;
    } else {
      controller = showOverlay(
        context: context,
        text: text,
      );
    }
  }

  /// Hide the Loading Screen.
  void hide() {
    controller?.close();
    controller = null;
  }

  /// Show the Loading Screen Overlay.
  LoadingScreenController showOverlay({
    required BuildContext context,
    required String text,
  }) {
    final text0 = StreamController<String>();
    text0.add(text);

    final state = Overlay.of(context);
    /// The loading overlay will be displayed as RenderBox.
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlay = OverlayEntry(builder: (context) {
      return loadingOverlay(size, text0);
    });

    state.insert(overlay);

    /// On close.
    return LoadingScreenController(close: () {
      text0.close();
      overlay.remove();
      return true;
    }, update: (text) {
      text0.add(text);
      return true;
    });
  }

  /// Look of the loading overlay.
  Material loadingOverlay(Size size, StreamController<String> text0) {
    return Material(
      /// Black box.
      color: Colors.black.withAlpha(150),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: size.height * 0.8,
            maxWidth: size.width * 0.8,
            minWidth: size.width * 0.5,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  StreamBuilder(
                    stream: text0.stream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data as String,
                          textAlign: TextAlign.center,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
