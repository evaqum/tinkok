import 'package:injectable/injectable.dart';

import '../../domain/repositories/lock_repository.dart';

@Injectable(as: LockRepository)
final class MockLockRepository implements LockRepository {
  const MockLockRepository();

  @override
  Future<bool> checkPasscode(String passcode) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return passcode == '1234';
  }

  @override
  Future<void> setPasscode(String passcode) async {}
}
