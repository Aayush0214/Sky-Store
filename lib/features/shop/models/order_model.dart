import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sky_store/features/personalization/models/address_model.dart';
import 'package:sky_store/features/shop/models/cart_item_model.dart';
import 'package:sky_store/utils/constants/enums.dart';
import 'package:sky_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/image_strings.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double subtotal;
  final double shippingCost;
  final double tax;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final String paymentIcon;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> item;

  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.item,
    required this.subtotal,
    required this.shippingCost,
    required this.tax,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Paypal',
    this.paymentIcon = SkyImages.payPal,
    this.address,
    this.deliveryDate,
  });

  String get formattedOrderDate =>
      SkyHelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null
      ? SkyHelperFunctions.getFormattedDate(deliveryDate!)
      : '';

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Item Delivered'
      : status == OrderStatus.processing
          ? 'Processing'
          : status == OrderStatus.shipped
              ? 'Order Shipped '
              : status == OrderStatus.pending
                  ? 'Order Placed'
                  : 'Order Cancelled';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.toString(),
      'subTotal': subtotal,
      'shippingCost': shippingCost,
      'tax': tax,
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'paymentIcon': paymentIcon,
      'address': address?.toJson(),
      'deliveryDate': deliveryDate,
      'items': item.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return OrderModel(
      id: data['id'] as String,
      userId: data['userId'] as String,
      status:
          OrderStatus.values.firstWhere((e) => e.toString() == data['status']),
      subtotal: data['subTotal'] as double,
      shippingCost: data['shippingCost'] as double,
      tax: data['tax'] as double,
      totalAmount: data['totalAmount'] as double,
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      paymentMethod: data['paymentMethod'] as String,
      paymentIcon: data['paymentIcon'] as String,
      address: AddressModel.fromMap(data['address'] as Map<String, dynamic>),
      deliveryDate: data['deliveryDate'] == null
          ? null
          : (data['deliveryDate'] as Timestamp).toDate(),
      item: (data['items'] as List<dynamic>)
          .map((itemData) =>
              CartItemModel.fromJson(itemData as Map<String, dynamic>))
          .toList(),
    );
  }
}
