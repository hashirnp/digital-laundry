import 'package:dartz/dartz.dart';
import 'package:laudney_frontend/Domain/Order/order_model.dart';

import '../../Core/Failure/main_failure.dart';

abstract class OrderService {
  Future<Either<MainFailure, List<OrderModel>>> getOrders(
      {required String userId});
}
