
import 'package:lseg/domain/models/course_model.dart';
import 'package:lseg/domain/models/faq_model.dart';

class AppConstants{
  static const splashScreenPauseTime = 3;
  static const contactUsMobileNo = "7977294381";
  static const contactUsEmail = "lseg@gmail.com";
  static const contactUsTwitter = "www.twitter.com";
  static const contactUsInstagram = "www.instagram.com";
  static const contactUsLinkedIn = "www.linkedin.com";
  static const dummyNetworkImage = "https://images.unsplash.com/photo-1501504905252-473c47e087f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80";
  static  List<FAQModel> faqItems = [
    FAQModel("Question 1", "Answer 1"),
    FAQModel("Question 2", "Answer 2"),
    FAQModel("Question 3", "Answer 3"),
    FAQModel("Question 4", "Answer 4"),
    FAQModel("Question 5", "Answer 5"),
    FAQModel("Question 6", "Answer 6"),
    FAQModel("Question 7", "Answer 7"),
  ];


  static  List<CourseModel> fakeCourses = [
    CourseModel("Course 100", "Creator DK", "Free"),
    CourseModel("Course 100", "Creator DK", "Free"),
    CourseModel("Course 100", "Creator DK", "Free"),
    CourseModel("Course 100", "Creator DK", "Free"),
    CourseModel("Course 100", "Creator DK", "Free"),
    CourseModel("Course 101", "Creator DK", "Paid"),
    CourseModel("Course 101", "Creator DK", "Paid"),
    CourseModel("Course 101", "Creator DK", "Paid"),
    CourseModel("Course 101", "Creator DK", "Paid"),
    CourseModel("Course 101", "Creator DK", "Paid"),
    CourseModel("Course 101", "Creator DK", "Paid"),
    CourseModel("Course 101", "Creator DK", "Paid"),
    CourseModel("Course 101", "Creator DK", "Paid"),
    CourseModel("Course 101", "Creator DK", "Paid"),
  ];
}
