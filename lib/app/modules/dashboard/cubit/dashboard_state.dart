part of dashboard_lib;

@immutable
abstract class DashboardState {
  const DashboardState();
}

class DashboardInitial extends DashboardState {
  const DashboardInitial();
}

class DashboardLoading extends DashboardState {
  const DashboardLoading();
}

class DashboardUserLoaded extends DashboardState {
  const DashboardUserLoaded();
}

class DashboardSuccess extends DashboardState {
  const DashboardSuccess();
}

class DashboardError extends DashboardState {
  final String message;

  const DashboardError(this.message);
}
