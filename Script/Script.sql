create database sekolah; -- membuat database
use sekolah; -- menampilkan database sekolah

-- membuat tabel siswa
create table siswa (
	id serial primary key,
	nama varchar(50) not null,
	umur int,
	jurusan varchar(50)
);
select * from siswa;

-- membuat tabel nilai
create table nilai (
	id serial primary key,
	id_siswa serial4 not null,
	mata_pelajaran varchar(50),
	nilai int,
	foreign key (id_siswa) references siswa(id)
);
select * from nilai;

-- mengisi value dari tabel siswa
insert into siswa (nama, umur, jurusan)
values 
('Andi', 16, 'IPA'),
('Budi', 17, 'IPS'),
('Asbahal', 17, 'IPA'),
('Bahal', 18, 'IPS'),
('Munawaroh', 19, 'TKJ'),
('Muna', 20, 'Multimedia'),
('Waroh', 21, 'Manajemen');
select * from siswa;

-- mengisi value dari tabel nilai
insert into nilai (id_siswa, mata_pelajaran, nilai)
values
(1, 'Matematika', 85),
(1, 'Matematika Peminatan', 80),
(2, 'Bahasa Inggris', 90),
(2, 'Sejarah', 90),
(3, 'TIK', 85),
(4, 'IPA', 70),
(5, 'Pemrograman', 75),
(5, 'Jaringan', 70),
(6, 'Bahasa Indonesia', 80),
(7, 'Manajemen', 100);
select * from nilai;

-- ini untuk menghitung nilai rata-rata pada masing-masing siswa
SELECT siswa.nama, AVG(nilai.nilai) AS rata_nilai
FROM siswa
JOIN nilai ON siswa.id = nilai.id_siswa
GROUP BY siswa.nama;

-- update pada tabel nilai kolom mata_pelajaran value Manajemen
-- menjadi value Kearsipan
UPDATE nilai
SET mata_pelajaran = 'Kearsipan'
WHERE mata_pelajaran = 'Manajemen';
-- menampilkan hasil dari update
select * from nilai;

-- menghapus value=Kearsipan dari kolom mata_pelajaran pada tabel nilai
delete from nilai
where mata_pelajaran = 'Kearsipan';
-- menampilkan hasil dari delete
select * from nilai;

-- menghapus semua record di tabel
truncate table nilai;
-- menghapus semua record di tabel tetapi pada nmr id memulai dari awal/mulai dari angka 1 kembali
truncate table nilai restart identity;
-- menghapus database
drop database sekolah;

-------------------------------------------------------------------------------------------------------------

-- Tambah query 1 --

-- query untuk mencari nilai tertinggi setiap siswa

select siswa.nama, max(nilai.nilai) as nilai_tertinggi_siswa
from siswa
join nilai on siswa.id = nilai.id_siswa
group by siswa.nama;


