import 'package:flutter/material.dart';

class MyNavBarItem extends StatefulWidget {
  const MyNavBarItem({super.key});

  @override
  State<MyNavBarItem> createState() => _MyNavBarItemState();
}

class _MyNavBarItemState extends State<MyNavBarItem> {
  @override
  Widget build(BuildContext context) {
    int selectedNavIndex = 0;

    List<Icon> navBarIcons = [
      Icon(Icons.home),
      Icon(Icons.work),
      Icon(Icons.calculate),
      Icon(Icons.tab)
    ];

    return SizedBox(
      child: Column(
        children: [
          AnimatedBar(isActive: selectedNavIndex == index),
          SizedBox(
            height: 36,
            child: Opacity(
              opacity: selectedNavIndex == index ? 1 : 0.5,
              child: IconButton(
                iconSize: selectedNavIndex == index ? 30 : 25,
                onPressed: () {
                  setState(() {
                    selectedNavIndex = index;
                  });
                },
                icon: navBarIcons[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: const BoxDecoration(
        color: Color(0xFF8184FF),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
