abstract class BaseParamsUseCase<TResult, TParam> {
  Stream<TResult> perform(TParam param);
}