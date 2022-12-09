import 'package:bloc/bloc.dart';
import 'package:finote_birhan_mobile/blocs/PlayerBackgroundColorCubit/backgroundState.dart';
import 'package:flutter/material.dart';

class BackgroundColorCubit extends Cubit<BackgroundColor>{
  BackgroundColorCubit() : super(BackgroundColor(initialBackgroundColor: Colors.red));
  void changeBackground(Color newColor)=>emit(BackgroundColor(initialBackgroundColor: newColor));
}