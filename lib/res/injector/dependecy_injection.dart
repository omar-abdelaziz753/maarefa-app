// ignore_for_file: constant_identifier_names

class Injector {
  static final Injector _injector = Injector._();
  Flavor? _flavor;
  factory Injector() {
    return _injector;
  }
  Injector._();
  cofigure(Flavor flavor) {
    _flavor = flavor;
  }

  T getRepository<T>(mockRepo, prodRepo) {
    switch (_flavor) {
      case Flavor.Mock:
        return mockRepo;
      default:
        return prodRepo;
    }
  }

  Flavor? get flavor => _flavor;
}

enum Flavor { Mock, Prod }
