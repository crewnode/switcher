import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<int> with ChangeNotifier {
  DashboardCubit() : super(0);

  void getDashboard() => emit(0);
  void getServers() => emit(1);
  void getBookmarks() => emit(2);
  void getSettings() => emit(3);
}