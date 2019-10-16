import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

enum AnimationToPlay {
  Activate,
  Deactivate,
  CameraTapped,
  PulseTapped,
  ImageTapped
}

class SmartFlareAnimation extends StatefulWidget {
  _SmartFlareAnimationState createState() => _SmartFlareAnimationState();
}

class _SmartFlareAnimationState extends State<SmartFlareAnimation> {
  // width and height retrieved from the artboard values in the animation

  static const double animationWidth = 295.0;
  static const double animationHeight = 251.0;

  bool isOpen = false;

  final FlareControls animationControls = FlareControls();

  AnimationToPlay _animationToPlay = AnimationToPlay.Deactivate;
  
  // Add our lastPlayed member
  AnimationToPlay _lastPlayedAnimation;

  // update our _setAnimationToPlay function
  void _setAnimationToPlay(AnimationToPlay animation) {
    var isTappedAnimation = _getAnimationName(animation).contains("_tapped");
    // We don't want to play the tapped animation if the last played one was deactivate
    if (isTappedAnimation &&
        _lastPlayedAnimation == AnimationToPlay.Deactivate) {
      return;
    }

    animationControls.play(_getAnimationName(animation));

    // remember our last played animation
    _lastPlayedAnimation = animation;
  }

  String _getAnimationName(AnimationToPlay animationToPlay) {
    switch (animationToPlay) {
      case AnimationToPlay.Activate:
        return 'activate';
        break;
      case AnimationToPlay.Deactivate:
        return 'deactivate';
        break;
      case AnimationToPlay.CameraTapped:
        return 'camera_tapped';
        break;
      case AnimationToPlay.PulseTapped:
        return 'pulse_tapped';
        break;
      case AnimationToPlay.ImageTapped:
        return 'image_tapped';
        break;
      default:
        return 'deactivate';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: animationWidth,
      height: animationHeight,
      child: GestureDetector(

          onTapUp: (tapInfo) async {
            var localTouchPosition = (context.findRenderObject() as RenderBox)
                .globalToLocal(tapInfo.globalPosition);

                print("local tocuh position "+localTouchPosition.toString());

            var topHalfTouched = localTouchPosition.dy < animationHeight / 2;

            var leftSideTouched = localTouchPosition.dx < animationWidth / 3;

            var rightSideTouched =
                localTouchPosition.dx > (animationWidth / 3) * 2;

            var middleTouched = !leftSideTouched && !rightSideTouched;

            // Call our animation in our conditional checks
            if (leftSideTouched && topHalfTouched) {
              _setAnimationToPlay(AnimationToPlay.CameraTapped);
              await new Future.delayed(const Duration(milliseconds: 600));
              _setAnimationToPlay(AnimationToPlay.Deactivate);
              isOpen = false;
            } else if (middleTouched && topHalfTouched) {
              _setAnimationToPlay(AnimationToPlay.PulseTapped);
              await new Future.delayed(const Duration(milliseconds: 600));
              _setAnimationToPlay(AnimationToPlay.Deactivate);
              isOpen = false;
            } else if (rightSideTouched && topHalfTouched) {
              _setAnimationToPlay(AnimationToPlay.ImageTapped);
              await new Future.delayed(const Duration(milliseconds: 600));
              _setAnimationToPlay(AnimationToPlay.Deactivate);
              isOpen = false;
            } else {
              if (isOpen) {
                _setAnimationToPlay(AnimationToPlay.Deactivate);
              } else {
                _setAnimationToPlay(AnimationToPlay.Activate);
              }

              isOpen = !isOpen;
            }
          },
          child: FlareActor('assets/animations/button-animation.flr',
              controller: animationControls,
              animation: _getAnimationName(_animationToPlay)
              )
              ),
    );
  }
}
