abstract interface class LockRepository {
  Future<bool> checkPasscode(String passcode);
  Future<void> setPasscode(String passcode);
}
