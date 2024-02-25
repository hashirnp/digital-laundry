import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:laudney_frontend/Core/Failure/main_failure.dart';
import 'package:laudney_frontend/Domain/Order/order_service.dart';
import 'package:laudney_frontend/Domain/Order/order_model.dart';


@LazySingleton(as: OrderService)
class OrderImplementation implements OrderService{
  @override
  Future<Either<MainFailure, List<OrderModel>>> getOrders({required String userId}) {
    throw UnimplementedError();
  }

}