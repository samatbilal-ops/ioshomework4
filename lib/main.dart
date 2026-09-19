abstract class MediaItem {
  String id;
  String title;
  double price;

  MediaItem(this.id, this.title, this.price);

  String getDetails();
}

// Mixin
mixin Downloadable {
  void download(String title) {
    print('Downloading: $title');
  }
}

// Audiobook
class Audiobook extends MediaItem with Downloadable {
  double durationHours;
  String narrator;

  Audiobook(
    String id,
    String title,
    double price,
    this.durationHours,
    this.narrator,
  ) : super(id, title, price);

  @override
  String getDetails() {
    return 'Audiobook: $title | Narrator: $narrator | '
        'Duration: ${durationHours}h | Price: \$$price';
  }
}

// EBook
class EBook extends MediaItem with Downloadable {
  double fileSizeMB;
  String author;

  EBook(
    String id,
    String title,
    double price,
    this.fileSizeMB,
    this.author,
  ) : super(id, title, price);

  @override
  String getDetails() {
    return 'EBook: $title | Author: $author | '
        'Size: ${fileSizeMB}MB | Price: \$$price';
  }
}

// Shopping Cart
class ShoppingCart {
  List<MediaItem> _items = [];

  // Add item
  void addItem(MediaItem item) {
    _items.add(item);
  }

  // Calculate total with tax
  double calculateTotalWithTax({double taxRate = 0.12}) {
    double total = _items.fold(
      0.0,
      (sum, item) => sum + item.price,
    );

    return total * (1 + taxRate);
  }

  // Filter items by maximum price
  List<MediaItem> filterByMaxPrice(double maxPrice) {
    return _items
        .where((item) => item.price <= maxPrice)
        .toList();
  }

  // Print receipt
  void printReceipt() {
    print('--- Receipt ---');

    for (var item in _items) {
      print(item.getDetails());

      if (item is Downloadable) {
        (item as Downloadable).download(item.title);
      }
    }

    print(
      'Total with tax: \$${calculateTotalWithTax().toStringAsFixed(2)}',
    );
  }
}

// Main
void main() {
  ShoppingCart cart = ShoppingCart();

  cart.addItem(
    Audiobook(
      'A1',
      'Atomic Habits',
      10.0,
      5.5,
      'James Clear',
    ),
  );

  cart.addItem(
    EBook(
      'E1',
      'Clean Code',
      15.0,
      3.2,
      'Robert Martin',
    ),
  );

  cart.addItem(
    Audiobook(
      'A2',
      'The Hobbit',
      12.0,
      8.0,
      'Andy Serkis',
    ),
  );

  // Print receipt
  cart.printReceipt();

  // Filter items under $12
  print('\nItems under \$12:');

  for (var item in cart.filterByMaxPrice(12.0)) {
    print(item.title);
  }
}