import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  final TabController tabController;

  const TabBarWidget({super.key, required this.tabController});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            TabItem(
              title: "Upcoming",
              index: 0,
              tabController: widget.tabController,
            ),
            TabItem(
              title: "Challenges",
              index: 1,
              tabController: widget.tabController,
            ),
            TabItem(
              title: "Past",
              index: 2,
              tabController: widget.tabController,
            ),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;
  final int index;
  final TabController tabController;

  const TabItem({
    super.key,
    required this.title,
    required this.index,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = tabController.index == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => tabController.animateTo(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected
                ? Theme.of(context).colorScheme.surface
                : Colors.transparent,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
