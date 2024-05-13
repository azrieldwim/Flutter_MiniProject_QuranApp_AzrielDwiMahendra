# Quran App

## About Project
Quran App adalah aplikasi mobile yang bertujuan untuk memudahkan pengguna dalam membaca, memahami, dan menelusuri Al-Quran secara digital. Tujuan utama aplikasi ini adalah untuk menyediakan pengalaman interaktif dan informatif bagi pengguna Muslim dalam menjelajahi teks suci Al-Quran.

## Features
Fitur Yang Terdapat Dalam Quran App

### User
#### 1. Introduction Page:
- Pengguna pertama kali membuka aplikasi akan disambut dengan halaman introduction.
- Halaman introduction berisi judul aplikasi, animasi atau gambar yang menarik, dan tombol "Get Started" untuk melanjutkan ke halaman selanjutnya.

#### 2. Sign In dan Sign Up Page:
- Jika pengguna belum masuk, mereka akan diarahkan ke halaman sign in atau sign up.
- Halaman ini berisi form untuk masuk atau mendaftar akun baru.

#### 3. Home Page:
- Setelah berhasil masuk, pengguna akan diarahkan ke halaman utama (home page).
- Halaman utama (Home Page) menampilkan informasi terkini kepada pengguna. 
- AppBar di bagian atas menampilkan judul "Quran App" dengan tombol profil untuk melihat informasi pengguna dan opsi sign out. 
- Bagian body terdiri dari tab controller dengan dua tab: SurahTab untuk menampilkan daftar surat Al-Quran dan JuzTab untuk informasi terkait Juz Al-Quran. 
- SurahTab menampilkan daftar surat dalam bentuk ListView yang dapat diklik untuk melihat detail surat. 
- Di bagian bawah layar, terdapat bottom navigation bar dengan tiga item: "Quran", "AI", dan "Bookmark" yang mengarahkan pengguna ke berbagai halaman dalam aplikasi sesuai dengan pilihannya. 
- Selain itu, ada fitur "Last Read" yang menampilkan informasi terakhir yang dibaca pengguna, seperti nama surat dan nomor ayat, yang diambil dari kontroler yang terhubung dengan aplikasi.

#### 4. Detail Page:
- Ketika pengguna memilih salah satu surat dari daftar surat pada home page, mereka akan diarahkan ke halaman detail surat.
- Halaman detail surat berisi banner dengan informasi singkat tentang surat tersebut (nama, nomor, jumlah ayat).
- Selanjutnya, daftar ayat dari surat Al-Quran ditampilkan dalam bentuk item-item yang berisi nomor ayat, teks Arab, teks Latin, dan terjemahan dalam bahasa Indonesia. 
- Setiap item ayat dilengkapi dengan dua tombol aksi: Tombol "Play" untuk memutar suara bacaan ayat dan tombol "Bookmark" untuk menandai ayat sebagai "Last Read" atau untuk menambahkan catatan.

#### 5. Bookmarks Page:
- Pengguna dapat mengakses halaman bookmarks untuk melihat daftar ayat yang mereka tandai atau simpan sebagai bookmark.
- Halaman ini menampilkan daftar surat beserta ayatnya dan note yang telah ditambahkan pengguna.
- apabila daftar surat di klik maka pengguna dapat mengedit isi dari note tersebut.

#### 6. AI Page:
- Terdapat halaman AI (Artificial Intelligence) yang memungkinkan pengguna untuk mengajukan pertanyaan tentang Al-Quran atau tafsirnya.
- AI akan memberikan respons berdasarkan pertanyaan pengguna, dengan fokus pada topik Al-Quran dan tafsir.


## Tech Stacks
Daftar tools yang saya gunakan adalah:
- Visual Studio Code
- Xcode emulator
- Github
- Flutter framework
- API Al-Quran
- SupaBase
- Library dari flutter : http, google_fonts, flutter_svg, lottie, path_provider, path, get, supabase_flutter, envied, envied_generator dan build_runner.