
import 'package:chia_wallet/core/utils/log.dart';

import 'module.dart';

class Injector {
  Binder _binder;

  Injector(this._binder) {
    // this._binder = binder;
  }

  T get<T>(dynamic key) {
    return _binder.get(key);
  }

  static InjectorBuilder builder() {
    return InjectorBuilder();
  }
}

class InjectorBuilder {
  late Binder _binder;
  List<Module> _modules = [];

  InjectorBuilder withBinder(Binder binder) {
    _binder = binder;
    return this;
  }

  InjectorBuilder withModule(Module module) {
    _modules.add(module);
    return this;
  }

  InjectorBuilder withModules(List<Module> modules) {
    _modules.addAll(modules);
    return this;
  }

  Injector build() {
    for (Module module in _modules) {
      module.configure(_binder);
    }
    return Injector(_binder);
  }
}

abstract class Binder {
  Binder _bind(dynamic key, Object to);

  Binding bind<T>(dynamic key);

  T get<T>(dynamic key);
}

abstract class Binding {
  Binder to(Object to);
}

class BinderImpl implements Binder {
  var _mapInstance = Map<dynamic, Object>();

  @override
  Binder _bind(dynamic key, Object obj) {
    if (_mapInstance.containsKey(key)) {
      Log.info("DI re-bind instance for key:" + key.toString());
    }
    _mapInstance[key] = obj;
    return this;
  }

  @override
  Binding bind<T>(dynamic key) {
    return BindingImpl(this, key);
  }

  @override
  T get<T>(dynamic key) {
    return _mapInstance[key] as T;
  }
}

class BindingImpl implements Binding {
  Binder _binder;
  dynamic _key;

  BindingImpl(this._binder, this._key);

  @override
  Binder to(Object to) {
    return _binder._bind(_key, to);
  }
}
