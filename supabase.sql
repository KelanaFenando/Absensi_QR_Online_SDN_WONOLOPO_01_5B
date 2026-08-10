-- ============================================================
-- ABSENSI QR ONLINE - SDN WONOLOPO 01 KELAS 5B
-- Jalankan SELURUH script ini di Supabase > SQL Editor > Run
-- ============================================================

create extension if not exists pgcrypto;

create table if not exists public.students (
  id uuid primary key default gen_random_uuid(),
  student_no integer,
  code text not null unique,
  nis text,
  nisn text,
  name text not null,
  class_name text not null default '5B',
  created_at timestamptz not null default now()
);

create table if not exists public.attendance (
  id uuid primary key default gen_random_uuid(),
  student_id uuid not null references public.students(id) on delete cascade,
  attendance_date date not null default current_date,
  status text not null check (status in ('Hadir','Izin','Sakit','Absen')),
  note text default '',
  scan_time timestamptz not null default now(),
  created_at timestamptz not null default now(),
  unique(student_id, attendance_date)
);

create index if not exists attendance_date_idx
  on public.attendance(attendance_date);
create index if not exists attendance_student_idx
  on public.attendance(student_id);

-- Seed 30 siswa contoh. NIS/NISN bisa diedit dari menu Data Siswa.
insert into public.students (student_no, code, nis, nisn, name, class_name)
select
  g,
  '5B-' || lpad(g::text, 3, '0'),
  'NIS-5B-' || lpad(g::text, 3, '0'),
  'NISN-5B-' || lpad(g::text, 3, '0'),
  'Siswa ' || g,
  '5B'
from generate_series(1,30) g
where not exists (
  select 1 from public.students s
  where s.code = '5B-' || lpad(g::text, 3, '0')
);

-- RLS
alter table public.students enable row level security;
alter table public.attendance enable row level security;

drop policy if exists "students_public_select" on public.students;
drop policy if exists "students_public_insert" on public.students;
drop policy if exists "students_public_update" on public.students;
drop policy if exists "students_public_delete" on public.students;

create policy "students_public_select"
on public.students for select
to anon, authenticated using (true);

create policy "students_public_insert"
on public.students for insert
to anon, authenticated with check (true);

create policy "students_public_update"
on public.students for update
to anon, authenticated using (true) with check (true);

create policy "students_public_delete"
on public.students for delete
to anon, authenticated using (true);

drop policy if exists "attendance_public_select" on public.attendance;
drop policy if exists "attendance_public_insert" on public.attendance;
drop policy if exists "attendance_public_update" on public.attendance;
drop policy if exists "attendance_public_delete" on public.attendance;

create policy "attendance_public_select"
on public.attendance for select
to anon, authenticated using (true);

create policy "attendance_public_insert"
on public.attendance for insert
to anon, authenticated with check (true);

create policy "attendance_public_update"
on public.attendance for update
to anon, authenticated using (true) with check (true);

create policy "attendance_public_delete"
on public.attendance for delete
to anon, authenticated using (true);

-- Verify:
select count(*) as jumlah_siswa from public.students;
