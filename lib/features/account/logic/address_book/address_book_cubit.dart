import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/data/services/account_service/address_book_service.dart';
import 'package:depi_graduation_project/features/account/models/address_book/address_book_model.dart';
import 'package:meta/meta.dart';

part 'address_book_state.dart';

class AddressBookCubit extends Cubit<AddressBookState> {
  AddressBookCubit() : super(AddressBookInitial());
  AddressBookService addressBookService = AddressBookService();

  Future<void> loadAddressBooks(String userId) async {
    emit(AddressBookLoading());
    try {
      List<AddressBookModel> addressBooks = await addressBookService
          .getAddressList(userId);
      emit(AddressBookLoaded(addressBooks: addressBooks));
    } catch (e) {
      emit(AddressBookError(message: e.toString()));
    }
  }

  Future<void> addAddress(String userId, AddressBookModel address) async {
    emit(AddressBookLoading());
    try {
      await addressBookService.addAddress(address, userId);
      await loadAddressBooks(userId);
    } catch (e) {
      emit(AddressBookError(message: e.toString()));
    }
  }

  Future<void> removeAddress(String userId, AddressBookModel address) async {
    emit(AddressBookLoading());
    try {
      await addressBookService.removeAddress(address, userId);
      await loadAddressBooks(userId);
    } catch (e) {
      emit(AddressBookError(message: e.toString()));
    }
  }
}
