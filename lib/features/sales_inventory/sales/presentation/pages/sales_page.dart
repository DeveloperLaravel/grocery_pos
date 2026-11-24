
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_pos/core/database/di/injection.dart';

import '../bloc/sales_bloc.dart';
import '../bloc/sales_event.dart';
import '../bloc/sales_state.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SalesBloc>()
        ..add(const SalesEvent.watchRequested())
        ..add(const SalesEvent.statisticsRequested()),

      child: const SalesView(),
    );
  }
}

class SalesView extends StatelessWidget {
  const SalesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SalesBloc, SalesState>(
      listenWhen: (previous, current) =>
          previous.successMessage != current.successMessage ||
          previous.errorMessage != current.errorMessage,

      listener: (context, state) {
        if (state.successMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.successMessage!)),
          );
        }

        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },

      child: Scaffold(
        appBar: AppBar(
          title: const Text('المبيعات'),
        ),

        body: BlocBuilder<SalesBloc, SalesState>(
          builder: (context, state) {
            if (state.isLoading && state.sales.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              children: [
                Text('عدد الفواتير: ${state.salesCount}'),

                Text('إجمالي المبيعات: ${state.totalSales}'),

                Text('إجمالي المدفوع: ${state.totalPaid}'),

                Text('المتبقي: ${state.totalRemaining}'),

                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'ابحث برقم الفاتورة...',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      context.read<SalesBloc>().add(
                        SalesEvent.searchRequested(
                          query: value,
                        ),
                      );
                    },
                  ),
                ),

                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<SalesBloc>().add(
                        const SalesEvent.refreshRequested(),
                      );
                    },
                    child: ListView.builder(
                      itemCount: state.sales.length,
                      itemBuilder: (context, index) {
                        final sale = state.sales[index];

                        return ListTile(
                          title: Text(sale.invoiceNumber),
                          subtitle: Text(
                            sale.paymentStatus,
                          ),
                          trailing: Text(
                            sale.totalAmount.toString(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
