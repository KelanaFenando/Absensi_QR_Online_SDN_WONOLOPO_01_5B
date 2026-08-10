ABSENSI QR ONLINE - SDN WONOLOPO 01 KELAS 5B
================================================

FITUR
-----
- 30 siswa kelas 5B
- NIS dan NISN
- QR Code setiap siswa
- Scan QR dari HP/laptop
- Status Hadir, Izin, Sakit, Absen
- Edit status/keterangan absensi
- Hapus absensi
- Edit/tambah/hapus data siswa
- Rekap bulanan
- Cetak rekap
- Export CSV
- Lagu rukun-sama-teman.mp3
- Data tersimpan di Supabase sehingga HP dan laptop memakai database yang sama
- Cocok untuk GitHub Pages (static website)

URUTAN PEMASANGAN (PENTING)
----------------------------
1. Buka Supabase project Anda.
2. Masuk SQL Editor.
3. Buat query baru.
4. Buka file supabase.sql dari paket ini.
5. Copy SEMUA isinya ke SQL Editor.
6. Klik Run.
7. Pastikan hasil terakhir menunjukkan jumlah_siswa = 30.

8. Supabase -> Project Settings -> API.
9. Ambil Publishable/anon public key.
10. Buka config.js.
11. Ganti:
      GANTI_DENGAN_ANON_PUBLIC_KEY
    dengan anon/public key Anda.
    JANGAN memakai service_role key.

12. Upload SEMUA file paket ke repository GitHub:
      index.html
      config.js
      wallpaper.png
      rukun-sama-teman.mp3

13. Pastikan GitHub Pages mengambil branch main dan folder root (/).
14. Tunggu deployment selesai.
15. Buka URL GitHub Pages.

PENTING TENTANG SINKRONISASI
----------------------------
HP dan laptop tidak menyimpan absensi di browser.
Saat konfigurasi benar, keduanya membaca dan menulis tabel:
  public.students
  public.attendance
di Supabase.

Jadi:
HP scan -> data masuk Supabase -> laptop Refresh -> data yang sama tampil.
Laptop scan -> data masuk Supabase -> HP Refresh -> data yang sama tampil.

JIKA MUNCUL "DATABASE BELUM TERHUBUNG"
---------------------------------------
Biasanya salah satu dari:
- anon/public key belum dimasukkan ke config.js
- URL Supabase salah
- supabase.sql belum dijalankan
- RLS/policy belum dibuat (script SQL sudah membuatnya)
- browser masih memakai versi GitHub Pages lama; lakukan Ctrl+F5

CATATAN KEAMANAN
----------------
Versi ini memakai anon key dan policy publik agar mudah digunakan tanpa login.
Artinya siapa pun yang memiliki URL dapat mengubah data. Untuk penggunaan sekolah
yang lebih aman, langkah berikutnya sebaiknya ditambahkan login/admin PIN dan policy
RLS yang lebih ketat.

QR
--
QR berisi kode siswa seperti 5B-001.
Menu Data Siswa menyediakan QR yang dapat dicetak.
Saat scan, pilih status (default Hadir), lalu Simpan.

STATUS
------
Hadir = hadir
Izin  = izin
Sakit = sakit
Absen = tidak hadir tanpa keterangan

WALI KELAS
----------
Kelana Gusti Arwan Fernando, S.Pd.,Gr.
