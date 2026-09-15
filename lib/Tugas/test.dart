void main() {
  String toko = "Toko Buah";
  String pelanggan = "Budi Santoso";
  String barang = "Apel";

  int harga = 15000, jumlah = 2, stok = 10;
  bool member = true;

  int total = harga * jumlah;
  int potongan = total * 10 ~/ 100;
  int bayar = total - potongan;

  print("========== STRUK PEMBELIAN ==========");
  print("");
  print("Nama Toko      : $toko");
  print("Pelanggan      : $pelanggan");
  print("Barang         : $barang");
  print("Harga Barang   : Rp $harga");
  print("Jumlah Barang  : $jumlah");
  print("");
  print("Total Harga    : Rp$total");
  print("Diskon         : 10%");
  print("Potongan Harga : Rp$potongan");
  print("Total Bayar    : Rp$bayar");
  print("");
  print("Status Member  : $member");
  print("");
  print("Sisa Stok      : ${stok - jumlah}");
  print("");
  print("=====================================");
}