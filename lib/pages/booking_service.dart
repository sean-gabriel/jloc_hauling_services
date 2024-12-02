class BookingService {
  static final List<Map<String, String>> bookings = [];
  static final List<Map<String, String>> activeBookings = [];

  static void addBooking(Map<String, String> booking) {
    bookings.add(booking);
  }

  static List<Map<String, String>> getBookings() {
    return bookings;
  }

  static void acceptBooking(int index) {
    final booking = bookings.removeAt(index);
    activeBookings.add(booking);
  }

  static List<Map<String, String>> getActiveBookings() {
    return activeBookings;
  }
}
