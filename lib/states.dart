abstract class NewsStates 
{}

class NewsInitialState extends NewsStates{}

class NewsBottomNavState extends NewsStates{}

class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinesserrorState extends NewsStates
{
  final String error ;

  NewsGetBusinesserrorState(this.error);
}
class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}

class NewsGetSportserrorState extends NewsStates
{
  final String error ;

  NewsGetSportserrorState(this.error);

}
class NewsGetScienceLoadingState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}

class NewsGetScienceerrorState extends NewsStates
{
  final String error ;

  NewsGetScienceerrorState(this.error);
}

class NewsDarkModeStates extends NewsStates {}

class NewsGetDarkModeState extends NewsStates{}

class NewsGetSearchLoadingState extends NewsStates{}

class NewsGetSearchSuccessState extends NewsStates{}

class NewsGetSearcheerrorState extends NewsStates
{
  final String error ;

  NewsGetSearcheerrorState(this.error);

}
