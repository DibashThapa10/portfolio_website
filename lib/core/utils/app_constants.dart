import '../../data/models/custom_service.dart';
import '../../data/models/project.dart';
import 'app_assets.dart';

abstract class AppConstants {
  static const double appBarHeight = 80;
  static const List<CustomService> services = [
    CustomService(
      service: 'MOBILE DEVELOPMENT',
      logo: AppAssets.androidLogo,
      description:
          'I develop high-quality cross-platform mobile applications using Flutter and Dart, focusing on performance, scalability, and clean architecture.',
    ),
    CustomService(
      service: 'UI & UX DESIGNING',
      logo: AppAssets.uiDesignLogo,
      description:
          'I implement modern, user-friendly UI designs using Flutter, ensuring responsive layouts and smooth user experiences.',
    ),
    CustomService(
      service: 'APP DEPLOYMENT',
      logo: AppAssets.deploymentLogo,
      description:
          'I can publish and maintain mobile applications on Google Play Store and Apple App Store, including build configuration and release management.',
    ),
  ];
  static const List<Project> projects = [
    Project(
        name: 'Castin.io',
        imageUrl:
            'data:image/png;base64,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',
        description:
            'A production-ready mobile application deployed on both Play Store and App Store, focused on content streaming and user engagement.',
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.castin.io&pli=1',
        appleStore: 'https://apps.apple.com/us/app/castin-io/id6636480674'),
    Project(
        name: 'My Clinic Record',
        imageUrl:
            'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/19/89/62/198962cf-fdb1-168e-7f7b-c39412138477/AppIcon-1x_U007epad-0-1-0-85-220-0.png/400x400ia-75.webp',
        description:
            'A healthcare application that allows users to manage and track medical records securely with a clean and intuitive UI.',
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.my.clinic.record',
        appleStore:
            'https://apps.apple.com/us/app/my-clinic-record/id6741460008'),
    Project(
        name: 'Rolling HRMS',
        imageUrl:
            'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/1f/74/5b/1f745bb1-b973-cdb0-fdf0-8ba447047ebc/AppIcon-1x_U007emarketing-0-10-0-0-85-220-0.png/400x400ia-75.webp',
        description:
            'An enterprise HR management system with employee records, attendance tracking, and role-based access.',
        googlePlay:
            'https://play.google.com/store/apps/details?id=rollingnexus.com.np.msa',
        appleStore: 'https://apps.apple.com/us/app/hrms-rolling/id6670351853'),
    Project(
      name: 'Rolling Nexus',
      imageUrl:
          'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/f4/14/33/f4143377-ef4f-acd3-e401-5d30dd194a01/AppIcon-1x_U007emarketing-0-10-0-0-85-220-0.png/200x200ia-75.webp',
      description:
          'A multi-purpose mobile platform connecting individuals and businesses through jobs, tenders, freelancing, events, forums, skill development, and digital services.',
      googlePlay:
          'https://play.google.com/store/apps/details?id=np.com.rollingplans.rolling_nexus',
      appleStore: 'https://apps.apple.com/us/app/rolling-nexus/id1550709920',
    ),
    Project(
      name: 'Bidesh-Rolling Karmashil',
      imageUrl:
          'https://play-lh.googleusercontent.com/XgwDHwJnD-Dh06d0FtF_miobh4zahImCWrum5OAi-4cvXmxw9hk4dHKPgdpl--ho55M=w240-h480-rw',
      description:
          'A mobile application providing reliable information on foreign employment, safer migration, complaint management, and support services for migrant and returnee workers.',
      googlePlay:
          'https://play.google.com/store/apps/details?id=np.com.rollingplans.rolling_karmasil_bidesh&pli=1',
    ),
    Project(
      name: 'Swadesh-Rolling Karmashil',
      imageUrl:
          'https://play-lh.googleusercontent.com/n91QrA7ERaZlHsnvayrs20ImwiThBpqLx5aS-XnhTu9MOc1mH4jPnGytb9B7IlP1r9HV=w240-h480-rw',
      description:
          'A job and service marketplace designed to empower blue-collar workers in Nepal by offering local employment, home services, ride-sharing, and market promotion opportunities.',
      googlePlay:
          'https://play.google.com/store/apps/details?id=np.com.rollingplans.rolling_karmaseel_swadesh',
    ),
    Project(
        name: 'Iprofixer Provider',
        imageUrl:
            'https://play-lh.googleusercontent.com/71QZgAKfh7HapLoX82_jEmeTB3SLMZ_lqEqkTPd9QgHD6flWrLu2tCUCeix_4txCtIs=w240-h480-rw',
        description:
            'A service provider platform enabling professionals to manage tasks, connect with clients, receive job requests, and grow their service-based business efficiently.',
        googlePlay:
            'https://play.google.com/store/apps/details?id=iprofixer.com.my.provider',
        appleStore:
            'https://apps.apple.com/us/app/iprofixer-provider/id6477434288'),
    Project(
      name: 'Iprofixer Client',
      imageUrl:
          'https://play-lh.googleusercontent.com/71QZgAKfh7HapLoX82_jEmeTB3SLMZ_lqEqkTPd9QgHD6flWrLu2tCUCeix_4txCtIs=w240-h480-rw',
      description:
          'A customer-facing mobile app that allows users to easily find, book, and manage trusted local service professionals for home and office needs.',
      appleStore: 'https://apps.apple.com/us/app/iprofixer-client/id6478153087',
      googlePlay:
          'https://play.google.com/store/apps/details?id=iprofixer.com.my.client',
    ),
    Project(
      name: 'Ness Global/Arctern',
      imageUrl:
          'https://play-lh.googleusercontent.com/pO6Z0EbC99dNvFY0ZkIzB9N3JZ9wJ6ywKFgfvSn_7-PkBm-kAb2Q_bzWZJjFnPzviKJliOMY1_dgNySQ-OOtGtY=w240-h480-rw',
      description:
          'A smart logistics and transportation app that helps drivers manage shipments, routes, documents, and real-time delivery updates in a single platform.',
      //   appleStore: 'https://apps.apple.com/us/app/iprofixer-client/id6478153087',
      googlePlay:
          'https://play.google.com/store/apps/details?id=com.arctern.app.qa',
    ),
    Project(
      name: 'Groease',
      imageUrl:
          'https://play-lh.googleusercontent.com/vLi-_bKMXKZuSy4E9mzlYME4TzYkh1YQuS5qHYAOSZWDjbXYJ04zhX0QhNJD3lR73_CMti6SyZhdq8q5maobPTg=w480-h960-rw',
      description:
          'A product comparison platform that enables users to compare prices across markets, manage accounts securely, and make informed purchasing decisions.',
      //   appleStore: 'https://apps.apple.com/us/app/iprofixer-client/id6478153087',
      googlePlay:
          'https://play.google.com/store/apps/details?id=com.groease.app',
    ),
  ];
}
