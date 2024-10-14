# Overview

The Chore Chart project is an iOS application for storing the chores that each child in a household completes. It is based on a point system and allows for the addition of rewards paid for from points earned doing chores. The project has functionality for adding and deleting children, adding and deleting custom chores and rewards, and adding and deleting any completed chores and rewards to a list attached to each child. There is also functionality for editing each child and each chore or reward. The project integrates with Google Firestore by saving each instance of an event, child, and completed event to the database. Adding, deleting, and modifying the database happens within the app. My purpose for writing this software was to become familiar with cloud database integration with iOS software development. I also wanted to create an application that I thought my own household could use.

[Chore Chart Demo Video](https://youtu.be/Dh-M8lb8iX8)

# Cloud Database

For this project I used Firebase Firestore by google. This is a NoSQL database, meaning data is not stored in tables and rows. Instead, Firestore uses a key-value pair document system. One upside to this is the data reads similar to JSON, generally making it easier for programmers to implement. However, one drawback I've noticed is it can be difficult to implement inheritance using the Identifiable protocol, because the only way to connect data of one type to another is through subcollections, and subcollections do not have their own unique ids. This required some work around when using List and ForEach in SwiftUI.

The structure of the database I used is pretty simple. I have two collections and one subcollection. My "Event" collection stores the name, type (chore or reward), and points cost/reward for each event. My "Child" collection stores a name and total points accrued. Within the Child collection is the "ChildEvent" subcollection. The "ChildEvent" subcollection stores everything an "Event" does plus a date of when the "ChildEvent" was completed.

# Development Environment

- xCode: Development environment
- Swift and SwiftUI: languages
- Google Firestore: database
- Squoosh: image compression
- SFSymbols: images for buttons

# Useful Websites

- [Mapping Firestore Data in Swift — The Comprehensive Guide](https://medium.com/firebase-developers/mapping-firestore-data-in-swift-the-comprehensive-guide-36ad05fb8109)
- [Squoosh](https://squoosh.app)
- [Swift Resources - Apple Developer](https://developer.apple.com/swift/resources/)
- [SwiftUI | Apple Developer Documentation](https://developer.apple.com/documentation/swiftui/)
- [SF Symbols - Apple Developer](https://developer.apple.com/sf-symbols/)

# Future Work

- Adjust all views so that they respond correctly to landscape orientation
- Adjust ChildView so that chores and rewards are different colors in the ScrollView
- Create views that show graphical statistics such as weekly/monthly chore completion
- Add an alert popup when deleting to avoid accidental deletion
