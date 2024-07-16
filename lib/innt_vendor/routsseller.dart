import 'package:demo_innt/innt_vendor/view/screen/bank_details/bank_details.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(
        name: '/BankDetails',
        page: () => BankDetails(),
        // transition: Transition.leftToRightWithFade,
        // transitionDuration: Duration(milliseconds: 500),
      ),
    ];
