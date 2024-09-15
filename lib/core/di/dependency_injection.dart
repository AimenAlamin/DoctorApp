import 'package:dio/dio.dart';
import 'package:doctor/features/home/data/api/home_api_service.dart';
import 'package:doctor/features/home/data/repos/home_repo.dart';

import 'package:doctor/features/login/data/repo/login_repo.dart';
import 'package:doctor/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:doctor/features/sign_up/logic/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

/// we put all our dependency injection in this function
Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  GetIt.instance.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // getIt.registerFactory(() => null) ==>> استخدام ام اكثر من مره وكل مره اطلع منه اةبجكت
  //  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
