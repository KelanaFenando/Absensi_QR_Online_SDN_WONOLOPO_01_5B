-- DATABASE ABSENSI QR
-- Jalankan seluruh script ini di Supabase SQL Editor.

create table if not exists public.students (
  id uuid primary key default gen_random_uuid(),
  student_no integer not null,
  code text not null unique,
  name text not null,
  class_name text not null default '5B',
  created_at timestamptz not null default now()
);

create table if not exists public.attendance (
  id uuid primary key default gen_random_uuid(),
  student_id uuid not null references public.students(id) on delete cascade,
  attendance_date date not null,
  status text not null check (status in ('Hadir','Izin','Sakit','Alpa')),
  scan_time timestamptz not null default now(),
  created_at timestamptz not null default now(),
  unique(student_id, attendance_date)
);

create index if not exists attendance_date_idx on public.attendance(attendance_date);
create index if not exists attendance_student_idx on public.attendance(student_id);

-- 30 siswa awal
insert into public.students(student_no,code,name,class_name)
select n, '5B-'||lpad(n::text,3,'0'), 'Siswa '||n, '5B'
from generate_series(1,30) n
on conflict (code) do nothing;

-- RLS
alter table public.students enable row level security;
alter table public.attendance enable row level security;

-- Untuk versi awal tanpa login guru:
drop policy if exists "students_read" on public.students;
create policy "students_read" on public.students for select using (true);

drop policy if exists "students_update" on public.students;
create policy "students_update" on public.students for update using (true) with check (true);

drop policy if exists "attendance_read" on public.attendance;
create policy "attendance_read" on public.attendance for select using (true);

drop policy if exists "attendance_insert" on public.attendance;
create policy "attendance_insert" on public.attendance for insert with check (true);

drop policy if exists "attendance_update" on public.attendance;
create policy "attendance_update" on public.attendance for update using (true) with check (true);
