part of dashboard_lib;

class ListWeightData extends StatelessWidget {
  const ListWeightData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
        builder: (ctx, state) => Visibility(
              visible: state is DashboardUserLoaded &&
                  ctx.read<DashboardCubit>().listWeight.isNotEmpty,
              child: RefreshIndicator(
                onRefresh: () => ctx.read<DashboardCubit>().reloadWeightData(),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorConstant.neutralShadow.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(
                      dimensionConstant.spacing10,
                    ),
                  ),
                  height: functionSharing.screenHeight * 0.4,
                  margin:
                      EdgeInsets.symmetric(vertical: dimensionConstant.spacing12),
                  padding: EdgeInsets.symmetric(
                    vertical: dimensionConstant.spacing12,
                    horizontal: dimensionConstant.spacing12,
                  ),
                  child: state is DashboardLoading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: ctx.read<DashboardCubit>().listWeight.length,
                          addAutomaticKeepAlives: false,
                          addRepaintBoundaries: false,
                          shrinkWrap: true,
                          itemBuilder: (ctx, idx) => Padding(
                                padding: EdgeInsets.only(
                                  bottom: dimensionConstant.spacing8,
                                ),
                                child: ItemOutlineCardDashboard(
                                  enableFullWidth: true,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          '${ctx.read<DashboardCubit>().listWeight[idx].currentWeight} ${stringConstant.kilo}'),
                                      Text(
                                          '${ctx.read<DashboardCubit>().listWeight[idx].save_date}'),
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () => ctx
                                                .read<DashboardCubit>()
                                                .editDataWeight(
                                                    id: ctx
                                                        .read<DashboardCubit>()
                                                        .listWeight[idx]
                                                        .id),
                                            child: Text(
                                              stringConstant.edit,
                                              style: styleConstant.Text14Body1(
                                                  customColor:
                                                      colorConstant.primaryBlue,
                                                  isSemiBold: true),
                                            ),
                                          ),
                                          TextButton(
                                              onPressed: () => ctx
                                                  .read<DashboardCubit>()
                                                  .deleteDataWeight(
                                                      id: ctx
                                                          .read<DashboardCubit>()
                                                          .listWeight[idx]
                                                          .id),
                                              child: Text(
                                                stringConstant.delete,
                                                style: styleConstant.Text14Body1(
                                                    customColor: colorConstant
                                                        .secondaryRedRose,
                                                    isSemiBold: true),
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                ),
              ),
            ));
  }
}
