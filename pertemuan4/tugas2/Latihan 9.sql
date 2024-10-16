SELECT * 
FROM jadwal_mata_kuliah 
WHERE id_dosen IN (
    SELECT id_dosen 9
    FROM dosen_pengajar 
    WHERE dosen_pengajar LIKE '%ang%'
)
ORDER BY nama_mata_kuliah ASC;
