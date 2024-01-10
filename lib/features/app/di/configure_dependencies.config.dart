// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:math' as _i5;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tinkok/features/accounts/data/repositories/mock_account_repository.dart'
    as _i9;
import 'package:tinkok/features/accounts/domain/repositories/account_repository.dart'
    as _i8;
import 'package:tinkok/features/app/di/module.dart' as _i10;
import 'package:tinkok/features/security/data/repositories/mock_lock_repository.dart'
    as _i4;
import 'package:tinkok/features/security/domain/repositories/lock_repository.dart'
    as _i3;
import 'package:tinkok/features/transactions/data/repositories/mock_transactions_repository.dart'
    as _i7;
import 'package:tinkok/features/transactions/domain/repositories/transactions_repository.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dependenciesModule = _$DependenciesModule();
    gh.factory<_i3.LockRepository>(() => const _i4.MockLockRepository());
    gh.factory<_i5.Random>(() => dependenciesModule.random);
    gh.factory<_i6.TransactionsRepository>(
        () => _i7.MockTransactionsRepository(random: gh<_i5.Random>()));
    gh.factory<_i8.AccountRepository>(
        () => _i9.MockAccountRepository(random: gh<_i5.Random>()));
    return this;
  }
}

class _$DependenciesModule extends _i10.DependenciesModule {}
