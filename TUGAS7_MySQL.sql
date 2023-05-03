-- TUGAS 7


-- Buat fungsi inputPelanggan(), setelah itu panggil fungsinya
 CREATE PROCEDURE inputPelanggan (
    -> IN nama_pelanggan VARCHAR(255),
    -> IN alamat VARCHAR(255),
    -> IN email VARCHAR(255)
    -> )
    -> BEGIN
    -> INSERT INTO pelanggan (nama_pelanggan, alamat, email)
    -> VALUES (nama_pelanggan, alamat, email);
    -> END;
    -> $$
    -- pemanggilan fungsi
     CALL inputPelanggan('nama_pelanggan', 'alamat', 'email');
    -> $$
-- Buat fungsi showPelanggan(), setelah itu panggil fungsinya
 CREATE PROCEDURE showPelanggan (idpel int)
    -> BEGIN
    -> SELECT * FROM pelanggan WHERE kartu_id = idpel;
    -> END
    -> $$
    --pemanggilan fungsi
    CALL showPelanggan(1);
    -> $$
-- Buat fungsi inputProduk(), setelah itu panggil fungsinya
CREATE PROCEDURE inputProduk(
    -> IN nama VARCHAR (50),
    -> IN harga_beli DECIMAL (10,2),
    -> IN stok INT)
    -> BEGIN
    -> INSERT INTO produk (nama, harga_beli, stok)
    -> VALUES (nama, harga_beli, stok);
    -> END $$
    -- pemanggilan fungsi
      CALL inputProduk('Produk A', 100000, 10);
    -> $$
-- Buat fungsi showProduk(), setelah itu panggil fungsinya
 CREATE PROCEDURE showProduk()
    -> BEGIN
    -> SELECT * FROM produk;
    -> END $$
-- Buat fungsi totalPesanan(), setelah itu panggil fungsinya
 CREATE PROCEDURE totalPesanana(
    -> IN hrg DOUBLE,
    -> IN jml INT,
    -> OUT total DOUBLE)
    -> BEGIN
    -> SET total * jml;
    -> SELECT @total;
    -> END $$
 --pemanggilan funsi
  CALL totalHarga(300000,3,@totalHarga);
    -> SELECT @totalHarga;
    -> $$
-- tampilkan seluruh pesanan dari semua pelanggan
SELECT * FROM pesanan_produk_vw;
-- buatkan query panjang di atas menjadi sebuah view baru: pesanan_produk_vw (menggunakan join dari table pesanan,pelanggan dan produk)
 CREATE VIEW pesanan_produk_vw AS
    -> SELECT pesanan.id AS id_pesanan, pelanggan.nama AS nama_pelanggan, produk.nama_produk AS nama_produk, pesanan.jumlah_pesanan AS jumlah_pesanan, pesanan.tanggal_pesan AS tanggal_pesan FROM pesanan
    -> JOIN pelanggan ON pesanan.id_pelanggan = pelanggan.id
    -> JOIN produk ON pesanan.id_produk = produk.id;
    -> $$