# 📱 PayFlow - Aplikasi Pembayaran Digital Mobile

[![Flutter Version](https://img.shields.io/badge/Flutter-v3.11.5-blue.svg?logo=flutter)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-v3.0+-blue.svg?logo=dart)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-lightgrey.svg)](#)
[![Theme](https://img.shields.io/badge/Theme-Dark%20Mode-violet.svg)](#)

**PayFlow** adalah aplikasi pembayaran digital modern berbasis mobile yang dirancang dengan antarmuka yang elegan, transisi animasi yang halus, dan sistem keamanan tingkat tinggi. Aplikasi ini dibangun menggunakan framework **Flutter** dan bahasa pemrograman **Dart** untuk memberikan performa terbaik di berbagai platform (Android, iOS, Web, dan Desktop).

> 💡 **Tagline:** *"Pembayaran Cepat & Aman"*

---

## 🎨 Design System & Estetika

PayFlow mengusung konsep desain **Premium Dark Mode** dengan sentuhan warna futuristik (*Deep Navy, Neon Purple, & Cyan*). 

| Elemen Desain | Spesifikasi | Deskripsi / Kode Warna |
|---|---|---|
| **Tema Utama** | Dark Mode | Fokus pada kenyamanan mata & efisiensi daya baterai. |
| **Background Utama** | Deep Navy | `#0A0E21` |
| **Surface / Card** | Dark Grey-Blue | `#1D1F33` |
| **Primary Color** | Neon Purple | `#6C63FF` (Digunakan untuk tombol utama & navigasi aktif) |
| **Secondary Color** | Electric Cyan | `#00D9FF` (Digunakan untuk Top Up & aksen grafis) |
| **Danger / Error** | Coral Red | `#FF6B6B` |
| **Success** | Emerald Green | `#4CAF50` |
| **Tipografi** | Roboto | Heading: Bold (20-36px), Body: Regular/Medium (12-16px) |
| **UI Components** | Modern Rounded | Border radius `12-24px` dengan *glow shadows* bermerek |

---

## 🚀 Fitur Utama & Status Pengembangan

Aplikasi dikembangkan dalam beberapa fase. Berikut adalah status fitur saat ini:

### ✅ Fase 1 (v1.0.0) - *Sudah Selesai & Siap Digunakan*
1. **Splash Screen (`splash_screen.dart`)**
   - Transisi pembuka selama ~3.6 detik.
   - Efek glow gradasi ungu-cyan, animasi elastis logo wallet, dan indikator loading progresif.
2. **Login Page (`login_page.dart`)**
   - Halaman masuk simulasi dengan form input email & password.
   - Validasi input dengan snackbar kesalahan (Coral Red).
   - Animasi fade-in & slide-up untuk form masuk.
3. **Session Management (`user_session.dart`)**
   - Ekstraksi nama pengguna secara dinamis berdasarkan format email (contoh: `salman.alfarisi@email.com` menjadi `Salman Alfarisi`).
   - Penanganan login state & pembersihan sesi saat logout.
4. **Home Page / Dashboard (`home_page.dart`)**
   - Teks sapaan dinamis berdasarkan sesi user yang aktif.
   - Kartu Saldo (Balance Card) dengan desain gradasi neon ungu dan glow shadow.
   - Akses cepat layanan (Transfer, Top Up, Tagihan, Lainnya).
   - Daftar transaksi terakhir & banner promo interaktif.
5. **Transfer Page (`transfer_page.dart`)**
   - Pilihan penerima dari daftar kontak favorit.
   - Input nominal dengan *quick amount chips* (Rp 50rb - Rp 500rb).
   - Dialog konfirmasi transaksi sebelum memproses transfer.
   - Tampilan dialog sukses transfer dengan animasi checkmark hijau.
6. **Top Up Page (`topup_page.dart`)**
   - Input nominal top up dengan warna tema Cyan.
   - Pilihan metode pembayaran lengkap (Virtual Account & E-Wallet).
   - Flow verifikasi dan sukses top up langsung.
7. **History Page (`history_page.dart`)**
   - Ringkasan pemasukan (hijau) & pengeluaran (merah).
   - Daftar riwayat transaksi lengkap dengan tipe badge (Transfer/Top Up/Tagihan).
8. **Profile Page (`profile_page.dart`)**
   - Circle avatar dinamis menggunakan inisial nama dari session.
   - Tampilan status membership ("Premium Member").
   - Statistik ringkasan transaksi & menu pengaturan profil.
   - Dialog konfirmasi logout untuk membersihkan session data.
9. **Bottom Navigation Bar (`main.dart`)**
   - Navigasi utama dengan 3 tab (Home, History, Profile) menggunakan efek blur dan bayangan glow.

---

### 🔲 Fase 2 (v2.0.0+) - *Rencana Pengembangan Fitur Baru*
* **Register Page** dengan strength indicator untuk password.
* **PIN & Biometric Security Page** untuk autentikasi transaksi menggunakan sensor fingerprint/Face ID.
* **Scan QR Code Page** (Tab Scan QR & Tab QR Saya) menggunakan `mobile_scanner` dan `qr_flutter`.
* **Bill Payment Page** untuk 8 kategori tagihan (PLN, PDAM, Internet, Pulsa, BPJS, dll).
* **E-Wallet Transfer** ke platform lain (GoPay, OVO, DANA, ShopeePay, LinkAja).
* **Savings Page** untuk melacak target keuangan (*finance goals*).
* **Rewards & Loyalty Program** (Daily check-in dan penukaran poin reward).
* **Digital Receipt** yang dapat diekspor ke format PDF atau dibagikan.

---

## 📂 Struktur File Proyek

```text
payment/
├── lib/
│   ├── main.dart                  # Entry point aplikasi & Bottom Navigation
│   ├── services/
│   │   └── user_session.dart      # Session manager (email & username parsing)
│   └── pages/
│       ├── splash_screen.dart     # Halaman pembuka beranimasi
│       ├── login_page.dart        # Halaman autentikasi simulasi
│       ├── home_page.dart         # Dashboard utama (Balance Card, Quick Actions)
│       ├── transfer_page.dart     # Halaman kirim saldo ke kontak
│       ├── topup_page.dart        # Halaman pengisian saldo via VA/E-Wallet
│       ├── history_page.dart      # Riwayat transaksi masuk & keluar
│       └── profile_page.dart      # Profil, statistik, & logout session
├── pubspec.yaml                   # Konfigurasi dependensi & aset
├── blueprint.txt                  # Dokumentasi spesifikasi lengkap aplikasi
└── README.md                      # Dokumentasi overview proyek
```

---

## 🛠️ Panduan Instalasi & Menjalankan Project

Ikuti langkah-langkah di bawah ini untuk menjalankan aplikasi PayFlow di perangkat lokal Anda:

### Prasyarat
- Pastikan **Flutter SDK** sudah terinstal di komputer Anda (versi `>= 3.11.5`).
- Jalankan perintah berikut untuk memverifikasi instalasi Flutter:
  ```bash
  flutter doctor
  ```

### Langkah Instalasi
1. Clone repositori ini atau masuk ke direktori project:
   ```bash
   cd payment
   ```

2. Unduh semua paket dependensi yang dibutuhkan:
   ```bash
   flutter pub get
   ```

3. Jalankan aplikasi di emulator atau perangkat fisik Anda:
   ```bash
   flutter run
   ```

---

## 🔒 Arsitektur Keamanan (Rencana Masa Depan)

Untuk menjaga keamanan dana dan data pribadi pengguna, PayFlow dirancang dengan arsitektur keamanan berlapis:
1. **Otorisasi Transaksi:** Setiap transaksi wajib diverifikasi menggunakan PIN 6 digit atau Biometrik.
2. **Session Auto-Logout:** Sesi login pengguna akan berakhir otomatis setelah 15 menit tidak aktif.
3. **Enkripsi Lokal:** Data sensitif disimpan di penyimpanan lokal menggunakan enkripsi AES-256 (`flutter_secure_storage`).
4. **Token Security:** Menggunakan JWT (JSON Web Token) dengan skema rotasi akses token dan refresh token yang aman.

---

## 📦 Dependensi Utama

Aplikasi ini menggunakan beberapa package Flutter populer:
- [provider](https://pub.dev/packages/provider) - State Management (Rencana integrasi penuh)
- [cupertino_icons](https://pub.dev/packages/cupertino_icons) - Set ikon tambahan bergaya iOS
- [intl](https://pub.dev/packages/intl) - Formatting mata uang Rupiah (`Rp`) & tanggal transaksi

*(Untuk dependensi lengkap di Fase 2+, silakan lihat file `pubspec.yaml` atau `blueprint.txt`)*
