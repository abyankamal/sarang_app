import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sarang_app/src/features/autentication/data/data_user_account_local.dart';
import 'package:sarang_app/src/features/autentication/domain/user_account.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterAuthEvent>((event, emit) async {
      emit(AuthLoading());
      DataUserAccountLocal.setDataAccountToStorage(event.userAccount);
      UserAccountRegister.setUserAccountManager(event.isRegistered);
      await Future.delayed(Duration(seconds: 2));
      emit(
        AuthSucess(userAccount: event.userAccount, isRegistered: event.isRegistered)
      );
    });
  }
}
