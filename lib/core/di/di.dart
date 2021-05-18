
import 'injector.dart';
import 'module.dart';

class DI {
  static late Injector _injector;

  static void init(List<Module> modules) {
    _injector = Injector.builder()
        .withBinder( BinderImpl())
        .withModules(modules)
        .build();
  }

  static T get<T>(dynamic key) {
    return _injector.get(key);
  }
}
