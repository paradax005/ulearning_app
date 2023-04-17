import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/auth/register/bloc/register_blocs.dart';

import 'pages/auth/sign_in/bloc/sign_in_blocs.dart';
import 'pages/welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
      ];
}
