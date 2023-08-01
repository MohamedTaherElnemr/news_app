part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsNavBarState extends NewsState {}

//////business states /////////////
class BusinessLoadingState extends NewsState {}

class BusinessSuccessState extends NewsState {}

class BusinessFailedState extends NewsState {
  final String errorMessage;

  BusinessFailedState(this.errorMessage);
}

////////science states////////

class scienceLoadingState extends NewsState {}

class scienceSuccessState extends NewsState {}

class scienceFailedState extends NewsState {
  final String errorMessage;

  scienceFailedState(this.errorMessage);
}

//////////sports states //////

class SportsLoadingState extends NewsState {}

class SportsSuccessState extends NewsState {}

class SportsFailedState extends NewsState {
  final String errorMessage;

  SportsFailedState(this.errorMessage);
}

////////search states /////

class SearchLoadingState extends NewsState {}

class SearchSuccessState extends NewsState {}

class SearchFailedState extends NewsState {
  final String errorMessage;

  SearchFailedState(this.errorMessage);
}
