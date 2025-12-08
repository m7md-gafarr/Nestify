part of 'address_book_cubit.dart';

@immutable
sealed class AddressBookState {}

final class AddressBookInitial extends AddressBookState {}

final class AddressBookLoading extends AddressBookState {}

final class AddressBookLoaded extends AddressBookState {
  final List<AddressBookModel> addressBooks;

  AddressBookLoaded({required this.addressBooks});
}

final class AddressBookError extends AddressBookState {
  final String message;

  AddressBookError({required this.message});
}
