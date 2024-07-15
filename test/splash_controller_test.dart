import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:sample/app/data/repository/user_repository.dart';
import 'package:sample/app/modules/splash/controllers/splash_controller.dart';

// Example mock class for UserRepository
class MockUserRepository extends Mock implements UserRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter bindings are initialized

  late SplashController splashController;
  late MockUserRepository mockUserRepository;

  setUp(() {
    // Enable test mode for GetX
    Get.reset();
    Get.testMode = true;


    // Initialize the mock repository
    mockUserRepository = MockUserRepository();

    // Define behavior for the mock method
    when(mockUserRepository.getLanguage()).thenReturn("en_US");

    // Register the mock repository with GetX
    Get.lazyPut<UserRepository>(() => mockUserRepository);

    // Initialize the SplashController with the registered dependency
    splashController = SplashController(payload: "");
    Get.lazyPut<SplashController>( () => splashController);
  });

  tearDown(() {
    // Clean up the SplashController and the mock repository
    Get.delete<SplashController>();
    Get.delete<UserRepository>();
  });

  group('SplashController Test', () {
    test('Initial value should be 0', () {
      expect(splashController.count.value, 0);
    });

    test('Increment method should increase count value by 1', () {
      splashController.increment();
      expect(splashController.count.value, 1);
    });

    test('Decrement method should decrease count value by 1', () {
      splashController.increment(); // increment first to make count 1
      splashController.decrement();
      expect(splashController.count.value, 0);
    });
  });
}
