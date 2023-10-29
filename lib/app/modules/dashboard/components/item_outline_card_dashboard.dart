part of dashboard_lib;

class ItemOutlineCardDashboard extends StatelessWidget {
  const ItemOutlineCardDashboard(
      {required this.child,
      this.enableFullWidth = false,
      this.customColorOutline,
      super.key});

  final Widget child;
  final bool enableFullWidth;
  final Color? customColorOutline;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: enableFullWidth ? functionSharing.screenWidth : null,
      padding: EdgeInsets.symmetric(
          vertical: dimensionConstant.spacing12,
          horizontal: dimensionConstant.spacing16),
      decoration: BoxDecoration(
        color: colorConstant.naturalWhite,
        borderRadius: BorderRadius.circular(
          dimensionConstant.spacing10,
        ),
        border: Border.all(
          width: 1,
          color: customColorOutline != null
              ? customColorOutline!
              : colorConstant.neutralShadow,
        ),
      ),
      child: child,
    );
  }
}
