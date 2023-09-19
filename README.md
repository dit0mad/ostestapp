# ostestapp

Flutter Developer Test app for "Ourself".

## Note
Given the time constraint, most of my focus was led to the system design.
No unit tests or http mocking since the requirements does not state it.
The data set provided is mutated accordingly. 

## Getting Started

Please run "flutter pub get" to get all dependencies.

## Architecture.

The app is architected with bloc following MVC pattern.
All views have a binding (bloc) and each user interaction or communcation is done via sending events.
The app is layered as into 4 separate bloc
  - Navigation Bloc
  - Interactive Bloc
  - Data Bloc
  - Middleware Bloc
To find the data flow, follow the dispatching of events and to their respective Bloc.

* The middleware bloc is used to do some operations in the event of dispatching multiple events. This bloc will perform
  required operations and dispatch the result to their respective bloc.


