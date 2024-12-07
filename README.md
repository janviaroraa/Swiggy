# Swiggy Alias  —  [Problem Statement](https://docs.google.com/document/d/1lYqBw6F3irM3WlCogrK9W79k6kxRv2GXFwDJM_L3Qg0/edit?tab=t.0#heading=h.fb0e4ofnxwhw)
This project is a clone of the Swiggy app. It focuses on clean architecture, modular code, and performance. The app uses a programmatic UI approach and implements essential software design principles to ensure scalability and maintainability.
<br/>
- This project's minimum deployment version is set to `iOS 14.0`
<br/>
<br/>

# Requirements:
- [x] Sticky Header
- [x] Vertical Collection View
- [x] Horizontal Scroll Sections
- [x] Pull-to-Refresh Experience
- [x] Cell Navigation to Detail Page
- [x] Custom Tab Widgets
- [x] Custom Filters
<br/>

# Concepts Used
* Generic Colection View Architecture is followed
* Follows SOLID principle
* Programmatic UI
* No use of any third-party libraries
* MVVM pattern implementation
* Singleton design pattern
* Data Parsing - Codable (Here, only decoding of data is involved though)
* Enums
* Collection View
* UIKit
* DispatchQueue
* Efficient use of ViewController Life Cycles
* Forced Light Mode

<br/>
<br/>

# High-Level Overview of Generic Colection View Architecture

View Layer:
* FoodViewController: A feature-focused UIViewController designed to display food-related content in sections using a UICollectionView.
* UICollectionView: Displays images and handles dynamic sections efficiently.

Data Source Layer:
FoodSectionDataSource: A subclass to handle data for individual sections in the collection view.

ViewModel Layer:
FoodViewModel: Encapsulates data fetching and business logic, though it is minimal at this stage.

Delegate/Protocols:
Provides communication between the ViewController, sections, and cells via protocol `SectionItemsActionCellDelegate`.

<br/>
<br/>

# Snapshots
| Food Screen | Profile Screen | Item Detail Screen | Empty View |
| -- | -- | -- | -- |
| ![4](https://github.com/user-attachments/assets/97847c24-b147-4b48-b7d9-07371c2bacec) | ![3](https://github.com/user-attachments/assets/03a06161-48c4-467a-b956-9b35baba7992) | ![2](https://github.com/user-attachments/assets/85238e1b-7d15-49f4-b9ab-83fe68825f18) | ![1](https://github.com/user-attachments/assets/4cf421ed-2796-43f1-9611-ba5244c85d80) |

<br/>
<br/>

# Recordings
| Address Header  | Promotional Banners | Item Detail Screen | Pull to Refresh |
| ------------- | ------------- | ------------- | ------------- |
| <video src="https://github.com/user-attachments/assets/08168908-9fae-4b25-bc9b-d9ee35058b38"> | <video src="https://github.com/user-attachments/assets/f1b5468b-1685-4769-86a5-50e62d6af3ba"> | <video src="https://github.com/user-attachments/assets/9a2f9d74-4e4b-4edd-b0de-2e8ac8853dd4"> | <video src="https://github.com/user-attachments/assets/b92df8d9-08d2-4f9c-9d15-e69ee14cf1c4"> |

| AppIcon & Splash Screen  | Smooth Scrolling | Filters | Search Bar |
| ------------- | ------------- | ------------- | ------------- |
| <video src="https://github.com/user-attachments/assets/4e97d438-fa96-4741-a912-8317f5b665f2"> | <video src="https://github.com/user-attachments/assets/630ced30-ad25-487e-a950-70c4dd031655"> | <video src="https://github.com/user-attachments/assets/6423482e-4150-45d0-8d75-6c739c231252"> | <video src="https://github.com/user-attachments/assets/5ab4d938-bd21-4673-ba7b-7df374ca917e"> |
