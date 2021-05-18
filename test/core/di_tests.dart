
import 'package:chia_wallet/core/di/di.dart';
import 'package:chia_wallet/core/di/module.dart';
import 'package:flutter_test/flutter_test.dart';

class TestClass {
  var _x;

  TestClass(String x) {
    _x = x;
  }

  @override
  String toString() {
    return _x;
  }
}

class TestModule extends AbstractModule {
  @override
  void init() {
    bind(String).to("A String Instance");
    bind(int).to(404);
    bind(TestClass).to(TestClass(this.get(String)));
    bind("AnotherTestClass").to(TestClass("AnotherTestClass"));
  }
}

void main() {
  group('Dependency Injection', () {
    test("Init Module & Inject data", () {
      DI.init([TestModule()]);
      String str = DI.get(String);
      expect(str, equals("A String Instance"));

      int i = DI.get(int);
      expect(i, equals(404));

      TestClass cls = DI.get(TestClass);
      expect(cls.toString(), equals(str));

      TestClass anotherTestClass = DI.get("AnotherTestClass");
      expect(anotherTestClass.toString(), equals("AnotherTestClass"));
    });
  });
}
