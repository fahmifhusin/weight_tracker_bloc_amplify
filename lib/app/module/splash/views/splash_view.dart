part of splash_lib;

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashCubit>().loadSplashScreen();
    return Scaffold(
      backgroundColor: colorConstant.splashYellow,
      body: BlocListener<SplashCubit, SplashState>(
        listener: (ctx, state) {
          if (state is SplashSuccess) {
            ctx.read<SplashCubit>().gotoSignUpPageFromSplash();
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                assetsConstant.imageSplash,
                fit: BoxFit.fill,
                width: dimensionConstant.spacing200,
                height: dimensionConstant.spacing200,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: dimensionConstant.spacing8,
                    bottom: dimensionConstant.spacing20),
                child: Text(
                  stringConstant.weightTracker,
                  style: styleConstant.Text40Heading1(
                      customColor: colorConstant.naturalWhite),
                ),
              ),
              CircularProgressIndicator(
                color: colorConstant.naturalWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
