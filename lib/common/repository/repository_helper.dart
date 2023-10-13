import '../network/api_result.dart';

class RepositoryHelper<T> {
  Future<ApiResult<T>> checkItemsFailOrSuccess(Future<T> apiCallback) async {
    try {
      final T data = await apiCallback;
      return ApiResult.success(data);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }


}
