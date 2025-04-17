# arch_tech_task

the project was written in Flutter 3.24.0 

some of the packages such as AutoRoute and json_serializable i have used older versions as i was getting build issues when doing flutter pub get and did not want to waste time fixing thos as there wasa  time limit

Here are some things I would change:

Navigation: I’m currently using AutoRoute for navigation within the screens, and I handle navigation on onPress. A better approach would be to use a Bloc listener, which should have been implemented.


i have a http service but better error handling and adding things such as timeout issues

String Management: I would extract hardcoded strings and move them to a strings extension for better maintainability.

Theming: I did not implement theming, which should have been done to ensure a consistent look and feel across the app.

Testing: I did not write any tests, but in a production-level project, I would include both unit and widget tests.

Code Reusability: I would extract some reused code, especially related to styling, to promote better code reusability and maintainability.
