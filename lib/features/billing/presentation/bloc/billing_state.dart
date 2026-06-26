part of 'billing_bloc.dart';

class BillingState extends Equatable {
  final List<CartItem> cartItems;
  final String? error;
  final bool isPrinting;
  final bool printSuccess;
  final double vatRate; // VAT rate (default 13% for Nepal)

  const BillingState({
    this.cartItems = const [],
    this.error,
    this.isPrinting = false,
    this.printSuccess = false,
    this.vatRate = 0.13, // 13% VAT for Nepal
  });

  double get subtotal => cartItems.fold(0, (sum, item) => sum + item.total);
  double get vatAmount => subtotal * vatRate;
  double get totalAmount => subtotal + vatAmount;

  BillingState copyWith({
    List<CartItem>? cartItems,
    String? error,
    bool clearError = false,
    bool? isPrinting,
    bool? printSuccess,
    double? vatRate,
  }) {
    return BillingState(
      cartItems: cartItems ?? this.cartItems,
      error: clearError ? null : (error ?? this.error),
      isPrinting: isPrinting ?? this.isPrinting,
      printSuccess: printSuccess ?? this.printSuccess,
      vatRate: vatRate ?? this.vatRate,
    );
  }

  @override
  List<Object?> get props => [cartItems, error, isPrinting, printSuccess, vatRate];
}
