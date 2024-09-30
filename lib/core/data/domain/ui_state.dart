abstract class UiState<T> {
  const UiState._();

  factory UiState.success(T data) = UiStateSuccess<T>;

  factory UiState.error(String error) = UiStateError<T>;

  factory UiState.loading() = UiStateLoading<T>;

  factory UiState.initial() = UiStateInitial<T>;

  get isLoading => this is UiStateLoading;

  bool get isSuccess => this is UiStateSuccess;

  bool get isError => this is UiStateError;

  String get message => (this as UiStateError<T>).message;

  T get data => (this as UiStateSuccess<T>).data;

  W when<W>(
      {required W Function(T data) onSuccess,
      required W Function(String message) onError,
      required W Function() onLoading,
      W Function()? onInitial}) {
    if (this is UiStateSuccess) {
      return onSuccess((this as UiStateSuccess<T>).data);
    }
    if (this is UiStateError) return onError(this.message);
    if (this is UiStateInitial && onInitial != null) return onInitial();
    return onLoading();
  }
}

class UiStateError<T> extends UiState<T> {
  UiStateError(this.message) : super._();

  final String message;
}

class UiStateSuccess<T> extends UiState<T> {
  UiStateSuccess(this.data) : super._();

  final T data;
}

class UiStateLoading<T> extends UiState<T> {
  const UiStateLoading() : super._();
}

class UiStateInitial<T> extends UiState<T> {
  const UiStateInitial() : super._();
}
