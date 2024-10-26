import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.shadowColor = Colors.black12,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.blurRadius = 2,
    this.spreadRadius = 0,
    this.borderRadius,
    this.shadowOffset = Offset.zero,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 4),
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.showInactiveTitle = false,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final Color shadowColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final double blurRadius;
  final double spreadRadius;
  final Offset shadowOffset;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets itemPadding;
  final Curve curve;
  final bool showInactiveTitle;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ??
        (Theme.of(context).bottomAppBarTheme.color ?? Colors.white);

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (showElevation)
            BoxShadow(
              color: shadowColor,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
              offset: shadowOffset,
            ),
        ],
        borderRadius: borderRadius,
      ),
      child: Container(
        width: double.infinity,
        height: containerHeight,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: items.map((item) {
            var index = items.indexOf(item);
            return GestureDetector(
              onTap: () => onItemSelected(index),
              child: _ItemWidget(
                item: item,
                iconSize: iconSize,
                isSelected: index == selectedIndex,
                backgroundColor: bgColor,
                itemCornerRadius: itemCornerRadius,
                animationDuration: animationDuration,
                itemPadding: itemPadding,
                curve: curve,
                showInactiveTitle: showInactiveTitle,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final EdgeInsets itemPadding;
  final Curve curve;
  final bool showInactiveTitle;

  const _ItemWidget({
    Key? key,
    required this.iconSize,
    required this.isSelected,
    required this.item,
    required this.backgroundColor,
    required this.itemCornerRadius,
    required this.animationDuration,
    required this.itemPadding,
    required this.showInactiveTitle,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: (showInactiveTitle)
            ? ((isSelected)
                ? MediaQuery.of(context).size.width * 0.25
                : MediaQuery.of(context).size.width * 0.2)
            : ((isSelected)
                ? MediaQuery.of(context).size.width * 0.3
                : MediaQuery.of(context).size.width * 0.2),
        height: double.maxFinite,
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
          color: isSelected
              ? item.activeBackgroundColor.withOpacity(0.4)
              : backgroundColor,
          borderRadius: BorderRadius.circular(itemCornerRadius),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: (showInactiveTitle)
                ? ((isSelected)
                    ? MediaQuery.of(context).size.width * 0.25
                    : MediaQuery.of(context).size.width * 0.2)
                : ((isSelected)
                    ? MediaQuery.of(context).size.width * 0.3
                    : MediaQuery.of(context).size.width * 0.2),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconTheme(
                  data: IconThemeData(
                    size: iconSize,
                    color: isSelected
                        ? item.activeColor.withOpacity(1)
                        : item.inactiveColor ?? item.activeColor,
                  ),
                  child: item.icon,
                ),
                if (showInactiveTitle)
                  Flexible(
                    child: Container(
                      padding: itemPadding,
                      child: DefaultTextStyle.merge(
                        style: TextStyle(
                          color: item.activeColor,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        textAlign: item.textAlign,
                        overflow: TextOverflow.ellipsis,
                        child: item.title,
                      ),
                    ),
                  )
                else if (isSelected)
                  Flexible(
                    child: Container(
                      padding: itemPadding,
                      child: DefaultTextStyle.merge(
                        style: TextStyle(
                          color: item.activeColor,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        textAlign: item.textAlign,
                        overflow: TextOverflow.ellipsis,
                        child: item.title,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBarItem {
  BottomBarItem({
    required this.icon,
    required this.title,
    this.activeColor = Colors.blue,
    this.activeBackgroundColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
  });

  final Widget icon;
  final Widget title;
  final Color activeColor;
  final Color activeBackgroundColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
}
