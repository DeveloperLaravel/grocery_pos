
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/di/injection.dart';
import '../bloc/customers_bloc.dart';
import '../pages/customers_page.dart';

class CustomersPageProvider extends StatelessWidget {
  const CustomersPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomersBloc>(
      create: (_) => getIt<CustomersBloc>(),
      child: const CustomersPage(),
    );
  }
}
