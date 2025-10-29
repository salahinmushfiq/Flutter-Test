# 🛠️ Smart Hardware Lab Management System

**Smart Hardware Lab** is a Flutter & Firebase-based IoT-enabled platform for managing a university or lab’s hardware inventory. It combines real-time tracking, RFID authentication, and student authorization to automate equipment checkouts and monitoring.

---

## 🌟 Project Highlights

- **IoT Integration:** Hardware items are tagged with RFID for secure automated check-in/check-out.
- **Inventory Management:** Track all equipment, availability, and student possession in real-time.
- **User Roles & Authorization:**
  - **Students:** Can borrow and return equipment, view their history.
  - **Admins / Lab Supervisors:** Manage hardware inventory, monitor usage, and generate reports.
- **Real-Time Updates:** Powered by Firebase Realtime Database to instantly reflect hardware status.
- **Media Support:** Equipment and categories include images stored in Firebase Storage.
- **Analytics & Logging:** Tracks historical checkouts, overdue items, and usage metrics.

---

## 🛠️ Technologies Used

- **Frontend:** Flutter, Dart
- **Backend & Services:** Firebase (Auth, Realtime Database, Storage)
- **Authentication:** Firebase Email/Password and Role-based Access Control
- **Real-time Data:** StreamBuilders to reflect live changes in inventory and checkouts
- **State Management:** Flutter `setState` with potential for `Provider`/`Riverpod` integration
- **UI Components:** Custom widgets for categories, equipment cards, and checkout/cart system

---

## 📱 Features

### Student View
- Browse categories and equipment.
- Scan RFID to borrow hardware.
- View currently borrowed hardware and due dates.
- Cart-like interface for batch checkout.

### Admin View
- Add, update, or remove hardware items.
- Monitor real-time equipment possession.
- Generate reports on hardware usage.
- Manage student permissions and access.

---

## 🔗 Project Structure

lib/
├─ models/ # Data models (Equipment, Category)
├─ screens/
│ ├─ category_screen.dart
│ ├─ cart_screen.dart
├─ widgets/ # Reusable widgets (CategoryListItem, EquipmentListItem)
├─ services/ # Firebase API and image download functions

yaml
Copy code

---

## 💡 Key Learnings

- Real-time state synchronization between Flutter UI and Firebase.
- Handling Firebase Storage for images and Firebase Realtime Database for structured data.
- Role-based authentication & authorization with Firebase.
- Building reactive UI with StreamBuilder + FutureBuilder.
- Managing IoT hardware inventory and automating lab workflows.

---

## 🚀 Live Demo / Screenshots

*(Optional: You can add screenshots or a video GIF of your app here to make it visually appealing)*

---

## 🔧 Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
Install dependencies:

bash
Copy code
flutter pub get
Configure Firebase:

Add google-services.json (Android) or GoogleService-Info.plist (iOS).

Enable Firebase Auth, Realtime Database, and Storage.

Run the app:

bash
Copy code
flutter run
📚 Skills Showcased
Flutter (Widgets, Navigation, State Management)

Firebase (Auth, Realtime Database, Storage)

Dart programming & async programming

IoT integration concepts (RFID-based access)

UI/UX design for responsive and interactive interfaces

Real-world project management and deployment skills

📝 Author
Mushfiq Us Salahin

