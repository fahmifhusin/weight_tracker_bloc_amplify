part of dashboard_lib;

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<DashboardCubit>().setDataDashboard();
    return styleConstant.GeneralAppPage(
      customAppBarColor: colorConstant.neutralShadowDarker,
      pageColor: colorConstant.naturalWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: dimensionConstant.spacing16,
          vertical: dimensionConstant.spacing32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           AccountPreview(),
            ListWeightData(),
            generalButtons.PrimaryButton(
                function: () =>context.read<DashboardCubit>().addDataWeight(),
                btnTitle: stringConstant.addWeightData),

          ],
        ),
      ),
    );
  }
}
