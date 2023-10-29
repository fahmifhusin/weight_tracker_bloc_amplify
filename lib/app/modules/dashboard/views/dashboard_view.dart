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
              builder: (ctx, state) => Column(
                children: [
                  Text(
                      'Name : ${state is DashboardUserLoaded ? context.read<DashboardCubit>().userName??'-' : '...'}'),
                  Text(
                      'Current Weight ${state is DashboardUserLoaded ? context.read<DashboardCubit>().currentWeight??'-' : '...'}'),
                  Text(
                      'Weight Goals ${state is DashboardUserLoaded ? context.read<DashboardCubit>().weightGoals??'-' : '...'}'),
                ],
              ),
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
