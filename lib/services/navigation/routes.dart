import 'package:flutter/cupertino.dart';
import 'package:pp_28/widgets/screens/add_card.dart';
import 'package:pp_28/widgets/screens/agreement.dart';
import 'package:pp_28/widgets/screens/edit_balance.dart';
import 'package:pp_28/widgets/screens/edit_operations.dart';
import 'package:pp_28/widgets/screens/income.dart';
import 'package:pp_28/widgets/screens/my_wallet.dart';
import 'package:pp_28/widgets/screens/privacy_agreement_screen.dart';
import 'package:pp_28/widgets/screens/statistics.dart';
import '../../widgets/screens/edit_card.dart';
import '../../widgets/screens/outcome.dart';
import '/widgets/screens/course_details.dart';
import '/widgets/screens/lesson.dart';
import '/widgets/screens/courses_lesson_step.dart';
import '/widgets/screens/finish_lesson.dart';
import '/widgets/screens/quiz.dart';
import '../../widgets/screens/courses.dart';
import '../../widgets/screens/balance.dart';
import '../../widgets/screens/home_menu.dart';
import '../../widgets/screens/onboarding.dart';
import '../../widgets/screens/splash.dart';
import 'route_names.dart';

typedef ScreenBuilding = Widget Function(BuildContext context);

class Routes {
  static Map<String, ScreenBuilding> get(BuildContext context) {
    return {
      RouteNames.splash: (context) => const SplashView(),
      RouteNames.onboarding: (context) => const OnboardingView(),
      RouteNames.home: (context) => const BalanceView(),
      RouteNames.homeMenu: (context) => const HomeMenuView(),
      RouteNames.courseDetails: (context) => CourseDetailsView(),
      RouteNames.courses: (context) => CoursesView(),
      RouteNames.courseLesson: (context) => LessonView(),
      RouteNames.coursesLessonStep: (context) => CoursesLessonStepView(),
      RouteNames.finishLesson: (context) => FinishLessonView(),
      RouteNames.quiz: (context) => const QuizView(),
      RouteNames.addCard: (context) => AddCardView(),
      RouteNames.editCard: (context) => EditCardView(),
      RouteNames.editBalance: (context) => EditBalanceView(),
      RouteNames.income: (context) => IncomeView(),
      RouteNames.outcome: (context) => OutcomeView(),
      RouteNames.editOperations: (context) => const EditOperationsView(),
      RouteNames.myWallet: (context) => const MyWalletView(),
      RouteNames.statistics: (context) => StatisticsView(),
      RouteNames.privacyAgreement: (context) => const PrivacyAgreementView(),
      RouteNames.agreement: (context) => AgreementView.create(context),
    };
  }
}
