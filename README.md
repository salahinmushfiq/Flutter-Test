# 🛍️ Flutter E-Commerce App (Firebase Powered)

A full-featured mobile e-commerce application built with **Flutter** and **Firebase**, featuring real-time product browsing, category filtering, cart management, and cloud-based image storage.

---

## 🚀 Features

### 🏷️ Product & Category System
- Dynamic product listing from Firebase Firestore
- Category-based filtering
- Product details with rating and pricing
- Real-time updates using Firestore streams

### 🛒 Cart System
- Add / remove products
- Quantity increment & decrement
- Auto subtotal calculation
- Swipe-to-delete (Dismissible UI)
- Promo code input UI (extendable)

### 🔍 Filtering & Sorting
- Newest / Oldest sorting (UI implemented)
- Price High → Low / Low → High (partially implemented)
- Ready for backend query optimization

### ☁️ Firebase Integration
- Firestore for structured product/category data
- Firebase Storage for product & category images
- Firebase Authentication (logout implemented)

### 🎨 UI/UX
- Custom themed UI
- Bottom sheet interactions (Add to Cart, Filters)
- Responsive layouts for mobile screens
- Card-based product and category design

---

## 🧱 Tech Stack

- **Flutter**
- **Dart**
- **Firebase Firestore**
- **Firebase Storage**
- **Firebase Auth**

---

## 📁 Project Structure


lib/
├── models/
│ ├── product.dart
│ ├── category.dart
│
├── screens/
│ ├── category_screen.dart
│ ├── cart_screen.dart
│
├── widgets/
│ ├── productlist_item.dart
│ ├── categorylist_item.dart
│ ├── add_to_cart_bottomsheet.dart
│ ├── filter_bottomsheet.dart
│ ├── productpagebottomsheets.dart
│
├── globals.dart
├── future.dart


---

## 🔥 Firebase Structure (Example)

### Categories Collection
```

categories/
- categoryId
- categoryLabel
- categoryImage
- ProductIdList

Products Collection

products/
- productId
- categoryId
- productLabel
- productDiscPrice
- productPrevPrice
- productRating
- productImage

Storage

category\_images/
product\_images/

⚙️ How to Run
git clone https://github.com/your-username/flutter-ecommerce-app.git
cd flutter-ecommerce-app
flutter pub get
flutter run

Make sure Firebase is configured:

Add google-services.json (Android)
Enable Firestore + Storage

📈 Future Improvements
Provider / Bloc state management migration
Payment gateway integration
Order tracking system
Admin dashboard
Product search system
Wishlist feature
👨‍💻 Author

Mushfiq Us Salahin

GitHub: https://github.com/your-profile
Portfolio: https://your-portfolio.com
⭐ Final Note

This project demonstrates:

Firebase integration in Flutter
Real-time UI updates
Modular widget design
Basic e-commerce architecture
