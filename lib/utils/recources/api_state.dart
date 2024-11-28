abstract class ApiState <T>{
  bool get isSuccess{
    return this is SuccessApiState;
  }
  bool get isLoading{
    return this is LoadingApiState;
  }
  bool get isError{
    return this is ErrorApiState;
  }
  ErrorApiState get error{
    return this as ErrorApiState;
  }
  T get getData{
    return (this as SuccessApiState<T>).data;
  }

}

class LoadingApiState extends ApiState {}

class SuccessApiState<T> extends ApiState {
  T data;
  SuccessApiState(this.data);
}

class ErrorApiState extends ApiState {
  String errorMessage;
  ErrorApiState(this.errorMessage);
}
