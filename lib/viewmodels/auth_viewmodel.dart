import 'package:start_mob/_config/locator.dart';
import 'package:start_mob/_constants/paths.dart';
import 'package:start_mob/_services/navigation_service.dart';
import 'package:start_mob/viewmodels/_basemodel.dart';

class AuthVM extends BaseModel {
  final NavigationService _nav = locator<NavigationService>();

  Future goToHome() async {
    await _nav.navigateTo(Paths.TestRoute);
  }

  Future goToRegister() async {
    await _nav.navigateTo(Paths.RegisterRoute);
  }
}
