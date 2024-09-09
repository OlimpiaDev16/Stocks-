# Stocks. Cash App 

A simple app that displays a list of stocks. 

## App Description

This app displays a list of stocks symbols and prices for a set of stocks parsed from a provided endpoint. 
The app is able to load data, handle errors and empty states.

## Getting started 
1. Make sure you have the Xcode verion 14.0 or above instaalled on your computer 
2. Clone the `Stocks` project from the repository into the directory of your choice.
3. Open and run the project 

After these steps you should see a screen displaying a simple list of stocks 🚀

## Architecture

- `Stocks` is implemented using the Model-View-ViewModel (MVVM) architecture pattern. 
- The model is in charge of the bussiness logic needed to access the data the app needs to display. It does this implementing dependency injection into the view model. This make it easy to create mock services and to test. 
- The view model handles the different states the data can provide. The view model is also responsible with providing the view a stable and easy way to display the data and handle data. 
- The view displays the data privided by the different states the view model can handle.  
- The app doesn't have any user interface.

## Running Tests: 

- The app can be tested using the build-in framework XCTest.
- Any changes to the model bussiness logic or to the view model's avility to handle the data states, will cause tests to fail (this is good, that means our tests are aware of these changes and perhaphs further tests need to be implemented)

## Structure
`Sources` files are shared accross the project.
`View` contains the main view.
`ViewModel` contains the view model.
`Model` contains the networking service. 

Note: I debaded on whether or not includind these changes since most folders have only one file. Ultimatly I opted for `YES` as an organizatioal tactic. Overall makes it easier to read and find files


## Endpoins 

The app makes use of the following endpoints:
- [Stocks enpoint used to populate or view](https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json)
- [Stocks enpoint to simulate an empty state](https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_empty.json)
- [Stocks enpoint to simulate a malformed URL](https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_malformed.json)

## UI Inspiration 

I used the apple's stock app for UI inspiration. I liked the cleaness and how easy to understand it is. 
[Apple stocks app](https://support.apple.com/en-mo/guide/iphone/iph1ac0b1bc/ios)

<img width="241" alt="Screenshot 2024-09-09 at 5 01 02 PM" src="https://github.com/user-attachments/assets/d7cfb975-0f96-46db-8caf-4cbe68d9f540">


### Articles of Interest

During the time I took to build this project I read some of the following articled to better informed my decisions making. 

- A good refresher on view modifyers: [🌁](https://www.hackingwithswift.com/quick-start/swiftui/how-to-get-custom-colors-and-transparency-with-sf-symbols)
- A good read on concurrency: [👩🏻‍💻](https://www.swiftbysundell.com/articles/the-main-actor-attribute/)
- Architectures: [🏢](https://medium.com/@icodingwithmaliha/decoding-ios-architecture-mvp-vs-mvc-vs-mvvm-vs-viper-fafa2d986f61)

## Notes from the candidate

Overall I enjoyed building this proyect. I like a new canvas. 
I started by deciding on architecture and creating a service. Second I created a view model followd by the view.
 Something I would've liked to implet was support to test the network and the UI. I opted not to for time reasons. 
Please reach out if you have ay questions. 





