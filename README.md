![MasterHeader](https://zphhqkbfmmilwzqcmdgu.supabase.co/storage/v1/object/public/profile/rickandomorty.webp)

# Rick and Morty application

Welcome to the Rick and Morty App Repository, a mobile app designed to give fans easy access to information about their favorite show. This project shows my experience in developing mobile applications using Flutter and demonstrates advanced techniques in managing data from an API using clean architecture principles and state management with Flutter Bloc.

## Download APK
Download the latest version of the app:
<a href="https://zphhqkbfmmilwzqcmdgu.supabase.co/storage/v1/object/public/profile/rickandmorty.apk?t=2024-05-14T22%3A09%3A07.227Z">Download APK</a>

## Characteristics

- **Character Navigation**: Browse through a complete list of Rick and Morty characters, with detailed profiles.
- **Clean Architecture**: The application is structured using a clean architecture, ensuring scalability, maintainability and testability.
- **Flutter Bloc**: Use Flutter Bloc for efficient state management in different modules of the application.

## Technology used
- **Flutter**: to create high-quality cross-platform mobile applications.
- **API**: This app gets data directly from the Rick and Morty API, which is an open RESTful API that provides information about the characters, locations, and episodes of the "Rick and Morty" series. .
- **Dart**: The programming language used together with Flutter.

## Project structure
- **Induction page**: shows the loading or home screen.
- **Home Page**: shows a list of characters.
- **Details Page**: shows the information of each character.

## From

### Previous requirements
You will need the following tools installed on your machine:
- Flutter 3.19.3
- Dart 3.3.1
- An IDE (VSCode, Android Studio or IntelliJ)

### Facility
Clone the repository:
```play
git clone https://github.com/DevLuiscode/richandmorty_app.git
cd rickandmortyapp
```
Install dependencies:
```play
pub flutter get
```

## Architecture
This project adheres to clean architecture guidelines, which are structured as follows:
- **Data layer**: Manages data transactions and transformations to and from the database.
- **Domain layer**: Contains entities and business logic.
- **Presentation layer**: comprises state management and UI components handled by Flutter Bloc.

## Contributions
Feel free to contribute to this project! Fork the repository and submit pull requests with the proposed changes. This project is for educational use.
