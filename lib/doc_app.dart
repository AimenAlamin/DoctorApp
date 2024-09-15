//import 'package:doctor/core/di/dependency_injection.dart';
import 'package:doctor/core/helpers/constants.dart';
import 'package:doctor/core/routing/app_router.dart';
import 'package:doctor/core/routing/routes.dart';
import 'package:doctor/core/theming/colors.dart';
//import 'package:doctor/features/home/logic/home_cubit.dart';
//import 'package:doctor/features/home/ui/home_screen.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: "DocBook",
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        // home: BlocProvider(
        //   create: (context) => HomeCubit(getIt())..getSpecializations(),
        //   child: const HomeScreen(),
        // ),
        initialRoute:
            isLoggedInUser ? Routes.loginScreen : Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
