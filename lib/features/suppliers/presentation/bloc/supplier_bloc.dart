import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_event.dart';
part 'supplier_state.dart';
part 'supplier_bloc.freezed.dart';

class SupplierBloc extends Bloc<SupplierEvent, SupplierState> {
  SupplierBloc() : super(_Initial()) {
    on<SupplierEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
