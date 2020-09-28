part of 'tema_bloc.dart';

abstract class TemaState extends Equatable {
  const TemaState();
}

class UygulamaTemasi extends TemaState {
  final ThemeData tema;
  final MaterialColor renk;

  @override
  List<Object> get props => [tema,renk];

  UygulamaTemasi({@required this.tema, @required this.renk});
}