import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'note_dot_component_model.dart';
export 'note_dot_component_model.dart';

class NoteDotComponentWidget extends StatefulWidget {
  const NoteDotComponentWidget({
    super.key,
    Color? colour,
    required this.onCircleTapAction,
    bool? isDisabled,
  })  : colour = colour ?? const Color(0xFF1C64FD),
        isDisabled = isDisabled ?? false;

  final Color colour;
  final Future Function()? onCircleTapAction;
  final bool isDisabled;

  @override
  State<NoteDotComponentWidget> createState() => _NoteDotComponentWidgetState();
}

class _NoteDotComponentWidgetState extends State<NoteDotComponentWidget>
    with TickerProviderStateMixin {
  late NoteDotComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoteDotComponentModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.1, 1.1),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isDisabled != true,
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
        onEnter: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = true);
          if (animationsMap['containerOnActionTriggerAnimation'] != null) {
            await animationsMap['containerOnActionTriggerAnimation']!
                .controller
                .forward(from: 0.0);
          }
        }),
        onExit: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = false);
          if (animationsMap['containerOnActionTriggerAnimation'] != null) {
            await animationsMap['containerOnActionTriggerAnimation']!
                .controller
                .reverse();
          }
        }),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await widget.onCircleTapAction?.call();
          },
          child: Container(
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              color: widget.colour,
              shape: BoxShape.circle,
            ),
          ),
        ).animateOnActionTrigger(
          animationsMap['containerOnActionTriggerAnimation']!,
        ),
      ),
    );
  }
}
