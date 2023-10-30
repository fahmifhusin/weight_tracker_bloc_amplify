part of dashboard_lib;

class ListWeightData extends StatelessWidget {
  const ListWeightData({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.read<DashboardCubit>().listWeight.isNotEmpty,
      child: Container(
        decoration: BoxDecoration(
          color: colorConstant.neutralShadow.withOpacity(0.5),
          borderRadius: BorderRadius.circular(
            dimensionConstant.spacing10,
          ),
        ),
        height: functionSharing.screenHeight * 0.4,
        margin: EdgeInsets.symmetric(vertical: dimensionConstant.spacing12),
        padding: EdgeInsets.symmetric(
          vertical: dimensionConstant.spacing12,
          horizontal: dimensionConstant.spacing12,
        ),
        child: ListView.builder(
            itemCount: context.read<DashboardCubit>().listWeight.length,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '${context.read<DashboardCubit>().listWeight[idx][argument.currentWeight]} ${stringConstant.kilo}'),
                        Text(
                            '${context.read<DashboardCubit>().listWeight[idx][argument.saveDate]}'),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () => context.read<DashboardCubit>().editDataWeight(id: 'isi id nya'),
                              child: Text(
                                stringConstant.edit,
                                style: styleConstant.Text14Body1(
                                    customColor: colorConstant.primaryBlue,
                                    isSemiBold: true),
                              ),
                            ),
                            TextButton(
                                onPressed: () => context.read<DashboardCubit>().deleteDataWeight(id: 'isi id nya'),
                                child: Text(
                                  stringConstant.delete,
                                  style: styleConstant.Text14Body1(
                                      customColor: colorConstant.secondaryRedRose,
                                      isSemiBold: true),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
