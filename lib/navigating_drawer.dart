import 'package:flutter/material.dart';

/// This is the wrapping widget with an initial
/// Drawer Page.
class NavigatingDrawer extends StatelessWidget {
  NavigatingDrawer({
    this.elevation = 16.0,
    this.semanticLabel,
    required this.body,
    this.backgroundColor = Colors.black,
    this.theme,
  });

  final double elevation;
  final String? semanticLabel;
  final Widget body;
  final Color backgroundColor;
  final ThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: elevation,
      semanticLabel: semanticLabel,
      child: MaterialApp(
        theme: theme,
        home: Scaffold(
          backgroundColor: backgroundColor,
          body: body,
        ),
      ),
    );
  }
}

/// This is the Drawer Page. Acts like a Material Page.
class NavigatingDrawerPage extends StatelessWidget {
  NavigatingDrawerPage({
    required this.body,
    this.backgroundColor,
  });

  final Widget body;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: body,
    );
  }
}

/// This is a Provided ListView with Drawer Item children.
class NavigatingDrawerList extends StatelessWidget {
  NavigatingDrawerList({required this.children});

  final List<NavigatingDrawerListItem> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: children,
    );
  }
}

/// Drawer List Item which implements a ListItem along
/// with custom onTap implementation for performing the
/// real magic of this package.
class NavigatingDrawerListItem extends StatelessWidget {
  const NavigatingDrawerListItem({
    Key? key,
    this.autofocus = false,
    this.contentPadding,
    this.enabled = true,
    this.focusColor,
    this.hoverColor,
    this.isThreeLine = false,
    this.leading,
    this.onLongPress,
    this.onTap,
    this.selected = false,
    this.shape,
    this.subtitle,
    this.title,
    this.trailing,
    this.backgroundColor,
    this.pushPage,
  }) : super(key: key);

  final bool autofocus;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final Color? focusColor;
  final Color? hoverColor;
  final bool isThreeLine;
  final Widget? leading;
  final Function? onLongPress;
  final Function? onTap;
  final bool selected;
  final ShapeBorder? shape;
  final Widget? subtitle;
  final Widget? title;
  final Widget? trailing;
  final Color? backgroundColor;
  final Widget? pushPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListTile(
        autofocus: autofocus,
        contentPadding: contentPadding,
        enabled: enabled,
        focusColor: focusColor,
        hoverColor: hoverColor,
        isThreeLine: isThreeLine,
        leading: leading,
        onLongPress: onLongPress != null ? onLongPress!() : null,
        onTap: () {
          if (pushPage != null) {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return pushPage ?? Container();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(-1, 0), end: Offset.zero)
                        .animate(animation),
                    child: child,
                  );
                },
              ),
            );
          }
          if (onTap != null) {
            onTap!();
          }
        },
        selected: selected,
        shape: shape,
        subtitle: subtitle,
        title: title,
        trailing: trailing,
      ),
    );
  }
}
