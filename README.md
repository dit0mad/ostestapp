# ostestapp

Flutter Developer Test app for "Ourself".

## Note
Given the time constraint, most of my focus was led to the system design.
No unit tests are done since the requirements does not state it. A simple UI is developed.
The data set provided was mutated accordingly. 

## Getting Started

Clone this repo on any IDE and run "flutter pub get" to get all dependencies.

## Architecture.

The app is architected with bloc following MVC pattern.
All views have a binding (bloc) and each user interaction or communcation is done via sending events and changes are made by emitting new states.
The app is layered into 4 separate blocs
  - Navigation Bloc
  - Interactive Bloc
  - Data Bloc
  - Middleware Bloc
    
To find the data flow, follow the dispatching of events and to their respective Bloc.

* The middleware bloc is used to do some operations in the event of dispatching multiple events. This bloc will perform
  required operations and dispatch the result to their respective bloc.
* All user interactions are handled within the interactive bloc.
* This app uses a custom navigation process with the navigator, all navigation is handled in the navigation bloc.


