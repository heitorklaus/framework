enum InitStatus {
  pending,
  working,
  success,
  error
}

abstract class Initiable {

  InitStatus get initStatus;

  Future<void> init();

}
