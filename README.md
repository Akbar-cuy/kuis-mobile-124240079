# LatihanKuis

Aplikasi katalog menu Gacoan sederhana yang dibuat menggunakan Flutter. Pengguna dapat login dengan akun demo, mencari menu berdasarkan nama, melihat detail menu, menandai menu sebagai favorit, dan melihat username pada halaman profil.

## Fitur

- Login menggunakan username dan password yang didefinisikan di aplikasi.
- Pencarian menu berdasarkan nama, tanpa membedakan huruf besar dan kecil.
- Daftar menu dikelompokkan ke kategori Mie, Dimsum, dan Minuman.
- Halaman detail menampilkan gambar, kategori, harga, deskripsi, dan tombol favorit.
- Status favorit ditampilkan pada daftar menu.
- Halaman profil menampilkan username yang sedang login dan menyediakan tombol logout.

## Akun Demo

| Username | Password |
| --- | --- |
| `admingacoan` | `12345` |
| `akbar` | `123` |
| `rafid` | `123` |

Akun demo tersimpan langsung di kode aplikasi. Belum tersedia pendaftaran akun atau autentikasi server.

## Menjalankan Aplikasi

Pastikan Flutter SDK sudah terpasang dan perangkat atau emulator tersedia, lalu jalankan dari direktori proyek:

```bash
flutter pub get
flutter run
```

## Struktur Utama

```text
lib/
	main.dart                 Titik masuk aplikasi
	root.dart                 Navigasi Home dan Profile
	models/data.dart          Model User, data akun, dan daftar menu
	screens/
		login_screen.dart       Halaman login
		home.dart               Daftar dan pencarian menu
		detail.dart             Detail menu dan tombol favorit
		profile_screen.dart     Profil pengguna dan logout
	assets/images/            Aset gambar lokal
```

Gambar menu dimuat dari Unsplash melalui jaringan internet. Logo login menggunakan aset lokal di `lib/assets/images/LogoMieGacoan.png`.

## Catatan

Data akun dan menu saat ini didefinisikan di dalam kode. Status favorit hanya berada di memori selama aplikasi berjalan; status tersebut belum disimpan setelah aplikasi ditutup dan belum dipisahkan per akun.
