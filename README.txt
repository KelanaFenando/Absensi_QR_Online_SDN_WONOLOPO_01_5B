ABSENSI QR ONLINE — SDN WONOLOPO 01 KELAS 5B

Teknologi:
- Frontend: HTML/CSS/JavaScript
- Database: Supabase PostgreSQL
- Hosting: GitHub Pages / Netlify / Vercel
- QR scanner: html5-qrcode

SETUP:
1. Buat project gratis di Supabase.
2. Buka SQL Editor.
3. Jalankan file supabase_schema.sql.
4. Di Supabase, ambil Project URL dan anon/publishable key.
5. Buka index.html.
6. Cari CONFIG di bagian JavaScript.
7. Ganti:
   SUPABASE_URL:"PASTE_SUPABASE_URL_HERE"
   SUPABASE_KEY:"PASTE_SUPABASE_ANON_OR_PUBLISHABLE_KEY_HERE"
8. Upload index.html ke hosting.
9. Buka website melalui HTTPS.
10. Kamera HP dapat digunakan untuk scan QR.

KEAMANAN:
Versi ini dibuat untuk tahap awal tanpa login. Karena policy update siswa dibuka, gunakan hanya untuk lingkungan sekolah yang Anda percayai.
Untuk penggunaan produksi, sebaiknya ditingkatkan dengan login guru/admin dan policy RLS berbasis authenticated user.

PENTING:
Jangan masukkan service_role key ke index.html.
