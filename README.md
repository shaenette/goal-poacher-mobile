====Tugas 1=====

Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
    Dalam Flutter, seluruh elemen yang ditampilkan pada layar merupakan widget, mulai dari teks, tombol, gambar, hingga elemen tata letak seperti Row, Column, atau Container. Semua widget tersebut tersusun secara hierarkis dalam suatu struktur yang disebut sebagai widget tree. Struktur ini menyerupai pohon, di mana setiap widget dapat memiliki satu atau lebih widget lain di dalamnya. Widget yang membungkus widget lain disebut parent, sedangkan widget yang berada di dalamnya disebut child. Hubungan antara parent dan child ini sangat penting karena widget parent menentukan bagaimana widget child akan ditampilkan, misalnya terkait posisi, ukuran, atau tata letak. Dengan adanya struktur widget tree ini, Flutter dapat menyusun interface user secara efisien dan fleksibel,karena setiap perubahan pada suatu widget dapat dengan mudah memengaruhi atau memperbarui bagian lain dari tampilan yang terkait di dalam tree tersebut.

Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
    1. MaterialApp, digunakan sebagai root dari aplikasi Flutter. Widget ini berfungsi untuk mengatur tema, judul aplikasi, dan menentukan halaman awal yang akan ditampilkan, dalam hal ini MyHomePage. Dengan MaterialApp, seluruh aplikasi mengikuti standar Material Design sehingga konsisten secara visual.

    2. ThemeData, digunakan untuk menentukan warna utama dan warna sekunder secondary aplikasi. Hal ini membuat tampilan UI menjadi konsisten dan mudah disesuaikan dengan karakteristik aplikasi.

    3. Scaffold, menyediakan kerangka dasar halaman aplikasi, termasuk AppBar di bagian atas dan body untuk menampung konten utama. Scaffold mempermudah pengaturan layout halaman secara keseluruhan.

    4. AppBar, menampilkan judul di bagian atas layar. Dalam proyek saya, AppBar menampilkan teks “Goal Poacher” dengan warna putih dan latar belakang biru.

    5. Text, digunakan untuk menampilkan teks pada berbagai elemen, termasuk judul AppBar, sambutan “Selamat datang di Goal Poacher”, dan nama tombol pada halaman utama. Text memungkinkan pengaturan gaya seperti ukuran font, tebal, dan warna.

    6. Padding, memberikan jarak di sekitar widget agar tampilan lebih rapi dan tidak menempel pada tepi layar atau widget lain. Padding digunakan di sekitar welcoming text dan grid item untuk memberi ruang visual.

    7. Column, menyusun beberapa widget secara vertikal dari atas ke bawah. Pada proyek ini, Column digunakan untuk menempatkan welcoming text di atas dan GridView di bawahnya sehingga tampilan menjadi berurutan dan mudah dibaca.

    8. GridView.count, menyusun widget dalam bentuk grid dengan jumlah kolom tertentu, dalam hal ini tiga kolom. GridView memudahkan menampilkan daftar tombol (All Products, My Products, Create Product) secara rapi dengan jarak antar item yang konsisten.

    9. Material, membungkus tombol agar efek visual Material Design seperti warna latar, bayangan, dan ripple effect dapat diterapkan. Material membuat tombol terlihat nyata dan interaktif.

    10. InkWell, menambahkan efek sentuhan (ripple effect) saat pengguna menekan tombol. Selain itu, InkWell digunakan untuk meng-handle aksi tekan tombol, misalnya menampilkan SnackBar.

    11. Container, digunakan sebagai wadah serbaguna untuk mengatur padding, warna latar, dan ukuran widget. Dalam proyek ini, Container mengatur layout internal pada ItemCard dan InfoCard.

    12. Center, menempatkan widget anak di posisi tengah dari ruang yang tersedia. Di proyek ini, Center digunakan untuk menempatkan ikon dan teks tombol agar berada di tengah card.

    13. Column (di dalam ItemCard), menyusun ikon dan teks secara vertikal di dalam setiap tombol agar tampil simetris dan rapi.

    14. Icon, menampilkan simbol grafis seperti shopping_bag, inventory, dan add pada tombol. Icon membuat tombol lebih intuitif karena pengguna bisa mengenali fungsinya secara visual.

    15. SnackBar, menampilkan pesan sementara di bagian bawah layar ketika pengguna menekan tombol. SnackBar memberikan feedback langsung kepada pengguna.

    16. ScaffoldMessenger, mengatur tampilan dan perilaku SnackBar, memungkinkan pesan muncul di atas layout Scaffold secara dinamis.

    17. Card, menampilkan informasi dalam kotak dengan bayangan (elevation), sesuai gaya Material Design. Card digunakan pada InfoCard untuk menampilkan informasi berupa judul dan konten.

    18. SizedBox, memberikan jarak antar elemen di dalam Card atau layout lainnya sehingga tampilan tidak terlihat terlalu padat.

    19. MediaQuery, digunakan untuk menyesuaikan ukuran widget dengan ukuran layar perangkat, misalnya menentukan lebar Card agar proporsional.

    20. ItemCard, adalah widget khusus untuk menampilka`n satu tombol pada halaman utama, lengkap dengan ikon, teks, warna latar, dan interaksi saat ditekan.

    21. InfoCard, adalah widget khusus untuk menampilkan informasi berbentuk card, dengan judul dan isi konten. Meskipun belum dipakai di halaman utama, widget ini siap digunakan untuk menampilkan data tambahan.

Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
    Widget MaterialApp berfungsi sebagai root dari aplikasi Flutter yang menggunakan desain Material Design. Widget ini menyediakan kerangka utama untuk aplikasi, termasuk pengaturan tema (ThemeData), judul aplikasi, navigasi antar halaman, lokalisasi, dan routing. Selain itu, MaterialApp secara otomatis menyediakan berbagai fitur bawaan Material Design, seperti animasi transisi halaman, scaffold, snackbar, dan dialog, sehingga mempermudah pengembangan antarmuka pengguna yang konsisten dan modern.

    MaterialApp sering digunakan sebagai widget root karena ia mengatur konfigurasi global aplikasi sekaligus menjadi container utama bagi seluruh widget lain. Dengan menempatkan MaterialApp sebagai root, semua widget di bawahnya dapat menggunakan tema, navigasi, dan fitur Material Design yang sama, sehingga tampilan dan perilaku aplikasi menjadi seragam. Selain itu, widget ini mempermudah pengelolaan routing dan state di seluruh aplikasi, membuat pengembangan menjadi lebih efisien dan terstruktur.

Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
    StatelessWidget adalah widget yang tidak memiliki state yang berubah-ubah setelah dibuat, sehingga tampilannya tetap sama selama lifecycle widget tersebut. Data yang ditampilkan widget ini biasanya diterima melalui constructor dan tidak dapat diperbarui dari dalam widget itu sendiri. Contoh penggunaannya adalah teks, ikon, atau tombol yang bersifat statis.

    Sedangkan StatefulWidget adalah widget yang memiliki state internal yang bisa berubah seiring waktu. Perubahan state ini dapat memicu rebuild widget sehingga tampilan diperbarui sesuai kondisi terbaru. Contohnya adalah form input, tombol yang berubah warna saat ditekan, atau daftar yang dapat diperbarui secara dinamis. Secara umum, StatelessWidget digunakan ketika tampilan bersifat statis, sedangkan StatefulWidget digunakan ketika widget perlu merespons interaksi pengguna atau perubahan data secara dinamis.

Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
    BuildContext adalah objek yang merepresentasikan lokasi sebuah widget dalam widget tree di Flutter. Setiap widget memiliki BuildContext yang diberikan oleh framework saat widget itu dibangun. Objek ini berisi informasi tentang posisi widget dalam hierarchy, parent-nya, dan data terkait lingkungan sekitarnya, seperti tema, ukuran layar, dan inherit widget lainnya.

    BuildContext sangat penting karena memungkinkan widget untuk mengakses informasi dari parent atau ancestor di widget tree. Misalnya, untuk mendapatkan tema aplikasi melalui Theme.of(context), ukuran layar dengan MediaQuery.of(context), atau menavigasi ke halaman lain menggunakan Navigator.of(context). Tanpa BuildContext, widget tidak dapat mengetahui konteks di mana ia berada dan tidak bisa memanfaatkan fitur yang bergantung pada hierarki widget.

    Dalam metode build, BuildContext diberikan sebagai parameter bernama context. Widget menggunakan parameter ini untuk mengakses parent widget atau ancestor, menampilkan widget yang bergantung pada lingkungan, dan melakukan navigasi antar halaman. Contohnya, menggunakan Theme.of(context) di dalam build memungkinkan widget mengambil tema yang berlaku dari ancestor di atasnya, sehingga tampilan bisa konsisten dan dinamis sesuai konteks.

Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
    Hot Reload adalah fitur Flutter yang memungkinkan developer memperbarui tampilan aplikasi secara cepat tanpa harus memulai ulang seluruh aplikasi. Ketika kode diubah, Flutter hanya memuat ulang widget tree dengan state yang ada, sehingga perubahan UI langsung terlihat, tetapi state (data saat runtime) tetap dipertahankan. Hot reload sangat berguna untuk iterasi cepat dalam desain UI atau layout, karena developer bisa langsung melihat hasil perubahan tanpa kehilangan data yang sudah ada di aplikasi.

    Hot Restart, di sisi lain, akan memulai ulang seluruh aplikasi dari awal, termasuk menghapus semua state yang ada. Semua widget akan dibangun ulang dari root, dan semua variabel, controller, atau data sementara akan di-reset. Hot restart biasanya digunakan ketika perubahan kode menyangkut state global, inisialisasi variabel, atau konfigurasi aplikasi yang tidak akan terpengaruh hanya dengan hot reload. 


==== Tugas 8 =====
Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

    Dalam Flutter, Navigator.push() dan Navigator.pushReplacement() sama-sama digunakan untuk berpindah antarhalaman, tetapi keduanya memiliki perbedaan dalam cara pengelolaan stacknya. Navigator.push() akan menambahkan halaman baru di atas halaman sebelumnya, sehingga user masih dapat kembali ke halaman awal dengan menekan tombol back. Misalnya, ketika user berada di HomePage lalu ingin menambahkan produk baru, penggunaan Navigator.push() memungkinkan mereka membuka halaman AddProductPage dan kembali ke HomePage setelah selesai. Sedangkan, Navigator.pushReplacement() akan menggantikan halaman saat ini dengan halaman baru,dan juga menghapus halaman sebelumnya dari stack. Dengan demikian, pengguna tidak bisa kembali ke halaman sebelumnya. Dalam aplikasi saya, Navigator.push() cocok digunakan saat berpindah dari HomePage ke AddProductPage, karena pengguna mungkin ingin membatalkan penambahan produk dan kembali. Namun, setelah data produk berhasil disimpan, Navigator.pushReplacement() lebih tepat digunakan agar pengguna langsung kembali ke HomePage tanpa harus kembali ke halaman form (yang masih menyimpan data sebelumnya) yang sudah tidak relevan. 

Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

    Dalam membangun struktur halaman aplikasi Goal Poacher, saya memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk memembuat tampilan yang konsisten dan mudah dinavigasi di seluruh halaman. Widget Scaffold digunakan sebagai kerangka utama yang menampung elemen-elemen penting seperti AppBar, Drawer, dan body, sehingga setiap halaman memiliki base structure yang seragam. AppBar berfungsi untuk menampilkan judul halaman dan memberikan identitas yang jelas pada setiap tampilan, misalnya judul “Goal Poacher” di halaman utama dan “Add Product Form” di halaman form. Sementara itu, Drawer digunakan sebagai menu navigasi (di samping) yang mempermudah pengguna berpindah antarhalaman. Dengan memanfaatkan ketiga widget ini secara konsisten pada setiap halaman, aplikasi menjadi lebih terorganisasi, memiliki tampilan yang selaras, dan memberikan user experiemce yang baik.

Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

    Penggunaan layout widget seperti Padding, SingleChildScrollView, dan ListView sangat membantu untuk menjaga tampilan form tetap rapi dan mudah digunakan. Misalnya pada aplikasi Goal Poacher, saya menggunakan Padding supaya jarak antar elemen seperti field input dan tombol tidak terlalu rapat, jadi tampilannya menjadi lebih nyaman dilihat. SingleChildScrollView saya pakai agar seluruh form bisa discroll, terutama ketika isi formnya panjang dan melebihi ukuran layar. Sedangkan, ListView berguna saat menampilkan banyak elemen secara vertikal dengan layout yang lebih fleksibel.


Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

    Untuk menyesuaikan warna tema aplikasi Goal Poacher, saya memilih kombinasi hijau tua dan emas agar sesuai dengan identitas toko bola dan terlihat elegan. Hijau tua (Color(0xFF004D40)) saya gunakan sebagai warna utama karena memberi kesan profesional dan merepresentasikan warna dari 'lapangan', sedangkan warna emas (Color(0xFFFFD700)) saya pakai sebagai warna sekunder untuk menonjolkan elemen penting seperti ikon dan tombol, sehingga tampilannya lebih mewah dan menarik. Saya juga menyesuaikan warna latar belakang dan teks agar kontrasnya pas dan nyaman dibaca. Dengan menerapkan kombinasi warna ini secara konsisten di seluruh aplikasi, saya memastikan Goal Poacher memiliki identitas visual yang jelas, sekaligus memberikan user experience yang menyenangkan.
    