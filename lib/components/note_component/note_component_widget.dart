import '/backend/schema/structs/index.dart';
import '/components/circle_button_component/circle_button_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'note_component_model.dart';
export 'note_component_model.dart';

class NoteComponentWidget extends StatefulWidget {
  const NoteComponentWidget({
    super.key,
    required this.note,
    this.onDeleteAction,
    this.onUpdateAction,
    required this.index,
    bool? isFullSize,
  }) : isFullSize = isFullSize ?? false;

  final NoteStruct? note;
  final Future Function()? onDeleteAction;
  final Future Function()? onUpdateAction;
  final int? index;
  final bool isFullSize;

  @override
  State<NoteComponentWidget> createState() => _NoteComponentWidgetState();
}

class _NoteComponentWidgetState extends State<NoteComponentWidget>
    with TickerProviderStateMixin {
  late NoteComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoteComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.note = widget.note;
      safeSetState(() {});
      if (widget.note?.isNew == true) {
        await Future.delayed(const Duration(milliseconds: 500));
        _model.isEditMode = true;
        safeSetState(() {});
      }
    });

    _model.noteDescriptionTextFieldTextController ??= TextEditingController();
    _model.noteDescriptionTextFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
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
    return Stack(
      alignment: const AlignmentDirectional(1.0, -1.0),
      children: [
        Container(
          width: widget.isFullSize ? double.infinity : 240.0,
          height: 240.0,
          decoration: BoxDecoration(
            color: widget.note?.colour,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    if (_model.isEditMode == false) {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          widget.note!.description,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumFamily),
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        width: 200.0,
                                        decoration: const BoxDecoration(),
                                        child: TextFormField(
                                          controller: _model
                                              .noteDescriptionTextFieldTextController,
                                          focusNode: _model
                                              .noteDescriptionTextFieldFocusNode,
                                          onFieldSubmitted: (_) async {
                                            _model.updateNoteStruct(
                                              (e) => e
                                                ..description = _model
                                                    .noteDescriptionTextFieldTextController
                                                    .text
                                                ..isNew = false,
                                            );
                                            safeSetState(() {});
                                            FFAppState().updateNotesAtIndex(
                                              widget.index!,
                                              (_) => _model.note!,
                                            );
                                            safeSetState(() {});
                                            _model.isEditMode =
                                                !_model.isEditMode;
                                            safeSetState(() {});
                                            await widget.onUpdateAction?.call();
                                          },
                                          autofocus: true,
                                          textInputAction: TextInputAction.done,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily),
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumFamily),
                                                lineHeight: 1.5,
                                              ),
                                          maxLines: null,
                                          cursorColor:
                                              FlutterFlowTheme.of(context).info,
                                          validator: _model
                                              .noteDescriptionTextFieldTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          dateTimeFormat(
                              "MMMMEEEEd",
                              dateTimeFromSecondsSinceEpoch(valueOrDefault<int>(
                                widget.note?.createDate?.secondsSinceEpoch,
                                0,
                              ))),
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Builder(
                            builder: (context) {
                              if (_model.isEditMode == false) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    safeSetState(() {
                                      _model
                                          .noteDescriptionTextFieldTextController
                                          ?.text = _model.note!.description;
                                      _model.noteDescriptionTextFieldTextController
                                              ?.selection =
                                          TextSelection.collapsed(
                                              offset: _model
                                                  .noteDescriptionTextFieldTextController!
                                                  .text
                                                  .length);
                                    });
                                    _model.isEditMode = !_model.isEditMode;
                                    safeSetState(() {});
                                  },
                                  child: wrapWithModel(
                                    model: _model.editButtonModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CircleButtonComponentWidget(
                                      icon: Icon(
                                        Icons.edit_outlined,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.updateNoteStruct(
                                      (e) => e
                                        ..description = _model
                                            .noteDescriptionTextFieldTextController
                                            .text
                                        ..isNew = false,
                                    );
                                    safeSetState(() {});
                                    FFAppState().updateNotesAtIndex(
                                      widget.index!,
                                      (_) => _model.note!,
                                    );
                                    safeSetState(() {});
                                    _model.isEditMode = !_model.isEditMode;
                                    safeSetState(() {});
                                    await widget.onUpdateAction?.call();
                                  },
                                  child: wrapWithModel(
                                    model: _model.updateButtonModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CircleButtonComponentWidget(
                                      icon: Icon(
                                        Icons.check,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                      colour: FlutterFlowTheme.of(context)
                                          .secondary,
                                      opacity: 1.0,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]
                .addToStart(const SizedBox(height: 16.0))
                .addToEnd(const SizedBox(height: 8.0)),
          ),
        ),
        if (_model.isEditMode != true)
          Container(
            decoration: const BoxDecoration(),
            child: MouseRegion(
              opaque: false,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered = true);
                if (animationsMap['iconOnActionTriggerAnimation'] != null) {
                  await animationsMap['iconOnActionTriggerAnimation']!
                      .controller
                      .forward(from: 0.0);
                }
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered = false);
                if (animationsMap['iconOnActionTriggerAnimation'] != null) {
                  await animationsMap['iconOnActionTriggerAnimation']!
                      .controller
                      .reverse();
                }
              }),
              child: Opacity(
                opacity: 0.5,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('Delete Sticky Note'),
                                content: const Text(
                                    'Are you sure you would like to delete this sticky note?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: const Text('Confirm'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        FFAppState().removeAtIndexFromNotes(widget.index!);
                        safeSetState(() {});
                        await widget.onDeleteAction?.call();
                      }
                    },
                    child: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['iconOnActionTriggerAnimation']!,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
