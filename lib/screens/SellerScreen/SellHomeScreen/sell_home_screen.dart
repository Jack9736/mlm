import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/main_appbar.dart';
import 'package:mlm/enum/Method.dart';

import 'package:mlm/screens/BuyerScreen/BuyHomeScreen/buy_home_controller.dart';
import 'package:mlm/screens/BuyerScreen/DrawerScreen/BuySideDrawer.dart';
import 'package:mlm/screens/SellerScreen/SellHomeScreen/sell_home_controller.dart';
import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';

import '../../../Widget/widget_appbar.dart';
import '../DrawerScreen/SellSideDrawer.dart';
import 'MockData.dart';

class SellHomeScreen extends StatefulWidget {
  @override
  _SellHomeScreenState createState() => _SellHomeScreenState();
}

class _SellHomeScreenState extends State<SellHomeScreen> {
  var sectionList = MockData.getExampleSections(3, 3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
          onTap: () {

          },
        ),
        body: ExpandableListView(
          builder: SliverExpandableChildDelegate<String, ExampleSection>(
            sectionList: sectionList,
            itemBuilder: (context, sectionIndex, itemIndex, index) {
              String item = sectionList[sectionIndex].items[itemIndex];
              return ListTile(
                leading: CircleAvatar(
                  child: Text("$index"),
                ),
                title: Text(item),
              );
            },
            sectionBuilder: (context, containerInfo) => _SectionWidget(
              section: sectionList[containerInfo.sectionIndex],
              containerInfo: containerInfo,
              onStateChanged: () {
                //notify ExpandableListView that expand state has changed.
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    setState(() {});
                  }
                });
              },
            ),
          ),
        ));
  }
}

class _SectionWidget extends StatefulWidget {
  final ExampleSection section;
  final ExpandableSectionContainerInfo containerInfo;
  final VoidCallback onStateChanged;

  _SectionWidget(
      {required this.section,
      required this.containerInfo,
      required this.onStateChanged});

  @override
  __SectionWidgetState createState() => __SectionWidgetState();
}

class __SectionWidgetState extends State<_SectionWidget>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);
  late AnimationController _controller;

  late Animation _iconTurns;

  late Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _iconTurns =
        _controller.drive(_halfTween.chain(CurveTween(curve: Curves.easeIn)));
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeIn));

    if (widget.section.isSectionExpanded()) {
      _controller.value = 1;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
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
      color: Colors.lightBlue,
      child: ListTile(
        title: Text(
          widget.section.header,
          style: TextStyle(color: Colors.white),
        ),
        trailing: RotationTransition(
          turns: _iconTurns as Animation<double>,
          child: const Icon(
            Icons.expand_more,
            color: Colors.white70,
          ),
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
