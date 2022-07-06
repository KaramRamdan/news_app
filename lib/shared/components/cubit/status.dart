abstract class NewsStatus {}

class NewsInitialState extends NewsStatus {}

class NewsBottomNavState extends NewsStatus {}

class NewsGetBusinessLoadingState extends NewsStatus {}

class NewsGetBusinessSuccessState extends NewsStatus{}

class NewsGetBusinessErrorState extends NewsStatus{
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportLoadingState extends NewsStatus {}

class NewsGetSportSuccessState extends NewsStatus{}

class NewsGetSportErrorState extends NewsStatus{
  final String error;

  NewsGetSportErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStatus {}

class NewsGetScienceSuccessState extends NewsStatus{}

class NewsGetScienceErrorState extends NewsStatus{
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetHealthLoadingState extends NewsStatus {}

class NewsGetHealthSuccessState extends NewsStatus{}

class NewsGetHealthErrorState extends NewsStatus{
  final String error;

  NewsGetHealthErrorState(this.error);
}

class NewsGetTechnologyLoadingState extends NewsStatus {}

class NewsGetTechnologySuccessState extends NewsStatus{}

class NewsGetTechnologyErrorState extends NewsStatus{
  final String error;

  NewsGetTechnologyErrorState(this.error);
}

class NewsChangeModeState extends NewsStatus {}


class NewsGetSearchLoadingState extends NewsStatus {}

class NewsGetSearchSuccessState extends NewsStatus{}

class NewsGetSearchErrorState extends NewsStatus{
  final String error;

  NewsGetSearchErrorState(this.error);
}
