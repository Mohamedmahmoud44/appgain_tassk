part of 'deep_link_cubit.dart';

@immutable
abstract class DeepLinkState {}

class DeepLinkInitial extends DeepLinkState {}
class DeepLinkNavigationLoadingState extends DeepLinkState {}
class DeepLinkNavigationLoadedState extends DeepLinkState {
  final int movieId;
  DeepLinkNavigationLoadedState({required this.movieId});
}
class DeepLinkNavigationFailState extends DeepLinkState {}
