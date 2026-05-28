import 'package:flutter/material.dart';

void main() {
  runApp(const CinemaApp());
}

class CinemaApp extends StatelessWidget {
  const CinemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas PAB Bioskop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

// ====================================================================
// MODEL & DUMMY DATA MOVIE (10 FILM)
// ====================================================================
class Movie {
  final String title;
  final String genre;
  final String imageUrl;
  final String rating;

  Movie({required this.title, required this.genre, required this.imageUrl, required this.rating});
}

final List<Movie> movieList = [
  Movie(title: 'Spiderman: No Way Home', genre: 'Action, Sci-Fi', imageUrl: 'https://images.unsplash.com/photo-1635805737707-575885ab0820?auto=format&fit=crop&w=500&q=60', rating: '8.2/10'),
  Movie(title: 'Avengers: Endgame', genre: 'Action, Sci-Fi', imageUrl: 'https://images.unsplash.com/photo-1608889825103-eb5ed706fc64?auto=format&fit=crop&w=500&q=60', rating: '8.4/10'),
  Movie(title: 'Joker', genre: 'Crime, Drama', imageUrl: 'https://images.unsplash.com/photo-1596727147705-61a532a659bd?auto=format&fit=crop&w=500&q=60', rating: '8.4/10'),
  Movie(title: 'Interstellar', genre: 'Adventure, Sci-Fi', imageUrl: 'https://images.unsplash.com/photo-1534447677768-be436bb09401?auto=format&fit=crop&w=500&q=60', rating: '8.6/10'),
  Movie(title: 'The Dark Knight', genre: 'Action, Crime', imageUrl: 'https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?auto=format&fit=crop&w=500&q=60', rating: '9.0/10'),
  Movie(title: 'Inception', genre: 'Action, Sci-Fi', imageUrl: 'https://images.unsplash.com/photo-1621252179027-94459d278660?auto=format&fit=crop&w=500&q=60', rating: '8.8/10'),
  Movie(title: 'Parasite', genre: 'Drama, Thriller', imageUrl: 'https://images.unsplash.com/photo-1574629910543-c0d1ff69794d?auto=format&fit=crop&w=500&q=60', rating: '8.5/10'),
  Movie(title: 'The Matrix', genre: 'Action, Sci-Fi', imageUrl: 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&w=500&q=60', rating: '8.7/10'),
  Movie(title: 'Gladiator', genre: 'Action, Drama', imageUrl: 'https://images.unsplash.com/photo-1605335198906-8dcd1bb1bd20?auto=format&fit=crop&w=500&q=60', rating: '8.5/10'),
  Movie(title: 'Avatar', genre: 'Action, Adventure', imageUrl: 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=500&q=60', rating: '7.8/10'),
];

// ====================================================================
// WIDGET NAVIGASI UTAMA
// ====================================================================
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const CinemaHomeScreen(),
    const MovieListScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // Warna biru seperti di referensi
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ====================================================================
// SCREEN 1: HOME (BIOSKOP)
// ====================================================================
class CinemaHomeScreen extends StatelessWidget {
  const CinemaHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BioskopGo', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?auto=format&fit=crop&w=800&q=80',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Kategori Film',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 15),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.2,
                children: [
                  _buildCategoryCard(Icons.local_movies, 'Action', Colors.red),
                  _buildCategoryCard(Icons.mood, 'Comedy', Colors.orange),
                  _buildCategoryCard(Icons.dark_mode, 'Horror', Colors.grey),
                  _buildCategoryCard(Icons.favorite, 'Romance', Colors.pink),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 4, spreadRadius: 1)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 45, color: color),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// ====================================================================
// SCREEN 2: MOVIE LIST (10 MOVIE SCROLLABLE)
// ====================================================================
class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Film', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: movieList.length, // List 10 Film
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      movie.imageUrl,
                      height: 100,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Text(movie.genre, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            Text(movie.rating, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Berhasil memesan tiket ${movie.title}!')),
                              );
                            },
                            child: const Text('Beli Tiket', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ====================================================================
// SCREEN 3: PROFILE SCREEN SESUAI SCREENSHOT TUGAS
// ====================================================================
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Bentuk Setengah Lingkaran (Lengkungan Atas)
            Positioned(
              top: -80,
              left: -50,
              right: -50,
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100, // Warna biru muda lengkungan
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(300),
                  ),
                ),
              ),
            ),
            
            // Bentuk Setengah Lingkaran (Lengkungan Bawah)
            Positioned(
              bottom: -80,
              left: -50,
              right: -50,
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(300),
                  ),
                ),
              ),
            ),
            
            // Konten Utama Profil
            Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Profile',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                const SizedBox(height: 30),
                
                // Ikon Avatar
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue.shade300, width: 2),
                    color: Colors.white,
                  ),
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person_outline, size: 50, color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 40),
                
                // Daftar Informasi Profil (Bisa diganti datanya)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(), // Mematikan scroll karena isi sedikit
                      children: [
                        _buildProfileItem(Icons.person_outline, 'Dimas Farrel Putra Prasetyo'),
                        _buildProfileItem(Icons.phone_outlined, '1462300074'),
                        _buildProfileItem(Icons.email_outlined, 'dimasfarrel@gmail.com'),
                        _buildProfileItem(Icons.location_on_outlined, 'Surabaya'),
                        _buildProfileItem(Icons.camera_alt_outlined, '@dimasfarrel'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi pembuat baris dengan ikon, teks, dan garis bawah
  Widget _buildProfileItem(IconData icon, String text) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ),
          ],
        ),
        const Divider(color: Colors.grey, thickness: 0.5, height: 30),
      ],
    );
  }
}