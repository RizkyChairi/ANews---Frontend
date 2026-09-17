# ANews Frontend

Aplikasi mobile **ANews** — platform berita digital yang menyajikan informasi seputar bencana alam dan isu lingkungan di Indonesia.

---

## Deskripsi

ANews Frontend adalah aplikasi mobile yang dibangun menggunakan **Flutter**. Aplikasi ini berkomunikasi dengan backend REST API untuk menampilkan daftar berita, detail berita, serta mengelola berita (tambah, edit, hapus) bagi pengguna yang sudah login.

Aplikasi menerapkan konsep **guest-first**, di mana pengguna dapat langsung melihat daftar berita tanpa harus login terlebih dahulu. Login hanya diperlukan untuk mengakses fitur interaktif seperti menambah, mengedit, atau menghapus berita.

---

## Persyaratan Sistem

- Flutter SDK versi 3.0 atau lebih baru
- Dart versi 3.0 atau lebih baru
- Android Studio atau VS Code dengan ekstensi Flutter
- Chrome (untuk testing web)
- Backend ANews sudah berjalan

---

## Instalasi

### 1. Clone Repository

```bash
git clone https://github.com/RizkyChairi/ANews-Frontend.git
cd ANews-Frontend