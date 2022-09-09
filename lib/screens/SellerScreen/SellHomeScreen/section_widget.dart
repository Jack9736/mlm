import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';

import '../../../Style/app_colors.dart';
import 'MockData.dart';

class SectionWidget extends StatefulWidget {
  final ExampleSection section;
  final ExpandableSectionContainerInfo containerInfo;
  final VoidCallback onStateChanged;

  const SectionWidget(
      {required this.section,
      required this.containerInfo,
      required this.onStateChanged});

  @override
  _SectionWidgetState createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);
  late AnimationController _controller;

  late Animation _iconTurns;

  late Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _iconTurns =
        _controller.drive(_halfTween.chain(CurveTween(curve: Curves.easeIn)));
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeIn));

    if (widget.section.isSectionExpanded()) {
      _controller.value = 1;
    }
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.containerInfo
      ..header = _buildHeader(context)
      ..content = _buildContent(context);
    return ExpandableSectionContainer(
      info: widget.containerInfo,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: AppColors.appBgColor,
      child: ListTile(
        title: Text(
          widget.section.header,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
             fontFamily: 'Gibson',
              color: AppColors.appTextColorBlue),
        ),
        onTap: _onTap,
      ),
    );
  }

  void _onTap() {
    widget.section.setSectionExpanded(!widget.section.isSectionExpanded());
    if (widget.section.isSectionExpanded()) {
      widget.onStateChanged();
      _controller.forward();
    } else {
      _controller.reverse().then((_) {
        widget.onStateChanged();
      });
    }
  }

  Widget _buildContent(BuildContext context) {
    return SizeTransition(
      sizeFactor: _heightFactor,
      child: SliverExpandableChildDelegate.buildDefaultContent(
          context, widget.containerInfo),
    );
  }
}
