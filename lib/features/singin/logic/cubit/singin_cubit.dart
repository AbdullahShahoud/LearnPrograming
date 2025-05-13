import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_programtion/features/singin/logic/cubit/singin_stare.dart';
import 'package:learn_programtion/features/singin/logic/model/singin_reqest.dart';
import 'package:learn_programtion/features/singin/logic/repo/singin_repo.dart';

enum Check { student, teacher }

class SinginCubit extends Cubit<SinginState> {
  SinginCubit(this._singinRepo) : super(const SinginState.initial());
  final SinginRepo _singinRepo;
  TextEditingController? controllerEmail = TextEditingController();
  TextEditingController? controllerPassword = TextEditingController();
  TextEditingController? controllerPasswordCon = TextEditingController();
  TextEditingController? controllerName = TextEditingController();
  var key = GlobalKey<FormState>();
  static SinginCubit get(context) => BlocProvider.of(context);
  Check? site = Check.student;
  bool obscure = true;
  bool obscure1 = true;
  void cnangeObscure(bool value) {
    obscure = !value;
  }

  void cnangeObscure1(bool value) {
    obscure1 = !value;
  }

  void emitSingin() async {
    emit(SinginState.initial());
    final respons = await _singinRepo.Singin(SinginRequest(
        email: controllerEmail?.text,
        password: controllerPassword?.text,
        name: controllerName?.text,
        type: '${site}',
        confimPassword: controllerPasswordCon?.text));
    respons.when(
      success: (singinRepo) {
        emit(SinginState.success(respons));
      },
      failure: (errorHandler) {
        emit(SinginState.error(error: 'notSingin'));
      },
    );
  }
}
