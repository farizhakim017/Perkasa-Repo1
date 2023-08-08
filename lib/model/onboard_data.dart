class OnBoarding {
  final String title;
  final String image;
  final String desc;

  OnBoarding({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
      title: 'Salam, Selamat Datang! \n ini adalah..',
      image: 'assets/images/perkasam-logo no background.png',
      desc: 'sebuah inisiatif untuk memperkasakan penggunaan Bahasa Melayu'),
  OnBoarding(
      title: 'Sehari selembar benang',
      image: 'assets/images/perkasam-logo (4).png',
      desc:
          'Setiap hari 1 perkataan, \n peribahasa ataupun \n ungkapan menarik baharu 👍'),
  OnBoarding(
      title: 'Antara fitur-fitur lain',
      image: 'assets/images/perkasam-logo (3).png',
      desc: 'kumpulan tatabahasa di hujung jari'),
  OnBoarding(
      title: 'Sudah bersedia?',
      image: 'assets/images/perkasam-logo.png',
      desc: 'masih banyak yang perlu diterokai')
];
