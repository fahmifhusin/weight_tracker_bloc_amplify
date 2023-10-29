part of dashboard_lib;

class DashboardView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    context.read<DashboardCubit>().getUserLoggedIn();
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          dimensionConstant.spacing16,
        ),
        child: Column(
          children: [
            BlocBuilder<DashboardCubit, DashboardState>(
              builder: (ctx, state) => Text(
                  '${stringConstant.hi} ${state is DashboardUserLoaded ? context.read<DashboardCubit>().dataUser?.username : '...'}'),
            ),
            generalButtons.PrimaryButton(
                function: () =>
                    context.read<DashboardCubit>().logoutFromDashboard(),
                btnTitle: stringConstant.signOut),
          ],
        ),
      ),
    );
  }
}
