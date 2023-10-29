part of dashboard_lib;

class AccountPreview extends StatelessWidget {
  const AccountPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (ctx, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stringConstant.appTitle,
                style: styleConstant.Text28Heading1(
                    customColor: colorConstant.splashYellow),
              ),
              TextButton(
                onPressed: () =>
                    context.read<DashboardCubit>().logoutFromDashboard(),
                child: Text(
                  stringConstant.signOut,
                  style: styleConstant.Text12SmallText(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: dimensionConstant.spacing18,
          ),
          Text(
            '${stringConstant.hello}${state is DashboardUserLoaded ? context.read<DashboardCubit>().userName ?? '-' : '...'}',
            style: styleConstant.Text22Heading1(customHeight: 1.5),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: dimensionConstant.spacing24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ItemOutlineCardDashboard(
                    child: Text(
                      '${stringConstant.initialWeight}\n${state is DashboardUserLoaded ? context.read<DashboardCubit>().initialWeight ?? '-' : '...'} ${stringConstant.kilo}',
                      textAlign: TextAlign.center,
                      style: styleConstant.Text14Body1(isSemiBold: true),
                    ),
                  ),
                ),
                SizedBox(
                  width: dimensionConstant.spacing16,
                ),
                Expanded(
                  child: ItemOutlineCardDashboard(
                    child: Text(
                      '${stringConstant.yourGoals}\n${state is DashboardUserLoaded ? context.read<DashboardCubit>().weightGoals ?? '-' : '...'} ${stringConstant.kilo}',
                      textAlign: TextAlign.center,
                      style: styleConstant.Text14Body1(isSemiBold: true),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ItemOutlineCardDashboard(
            enableFullWidth: true,
            child: Column(
              children: [
                Text(
                  stringConstant.yourCurrentWeight,
                  textAlign: TextAlign.center,
                  style: styleConstant.Text14Body1(isSemiBold: true),
                ),
                Text(
                  '80 ${stringConstant.kilo}',
                  style: styleConstant.Text18Heading2(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
