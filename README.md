# Quizzler

A basic flutter app, to do a quiz.
The quiz uses a local simple DB at the moment.

## Getting Started

The app start is at lib/main.dart.
Assets used in the apps are under assets.

Routes have been configured under lib/route/

The question logic is stored in lib/questions/

The UI is under lib/ui/

Clone the git repo, and run flutter run to emulate the app if from terminal, or use your preferred **IDE**.
Use flutter run -v, to catch any errors during run.

### TODO

- Implement the app with [openTDB](https://opentdb.com "Online Free Trivia DataBase") API, to let user select a category, as well as to increase the number of questions, instead of hardcoding it.
