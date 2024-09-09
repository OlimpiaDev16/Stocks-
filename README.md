# Stocks. Cash App 

A simple app that displays a list of stocks. 

## App Description

This app displays a list of stocks symbols and prices for a set of stocks parsed from a provided JSON endpoint. 
The app is able to handle loading data, errors and empty states.

## Getting started 
1. Make sure you have the Xcode verion 14.0 or above instaalled on your computer 
2. Clone the `Stocks` project from the repository into the directory of your choice.
3. Open and run the project 

After these steps you should see a screen displaying a simple list of stocks 🚀

## Architecture

- `Stocks` is implemented using the Model-View-ViewModel (MVVM) architecture pattern. 
- The model is in charge of the bussiness logic needed to access the data the app needs to display. It does this implementing dependency injection. This make it easy to create mock services to test. 
- The view model handles the different states the data can provide. The model is also responsible with providing the view a stable way to display the data.
- The view displays the data privided by the different states the view model can handle.  
- The app doesn't have any user interface.

## Running Tests: 

- The app can be tested using the build-in framework XCTest.
- Any changes to the model bussiness logic or to the view model's avility to handle the data states, will cause tests to fail (this is good, that means out tests are aware of these changes and perhaphs further tests need to be implemented)


## API - Endpoins 

The app makes use of the following endpoints:
- Stocks enpoint used to populate or view [link](https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json)
- Stocks enpoint to simulate an empty state: [link](https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_empty.json)
- Stocks enpoint to simulate a malformed URL: [link](https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_malformed.json)

## UI Inspiration 

I used the apple's stock app for UI inspiration. I liked the cleaness and how easy to understand it is. 
[link](https://support.apple.com/en-mo/guide/iphone/iph1ac0b1bc/ios)



### Articles of Interest

During the time I took to build this project I read some of the following articled to better informed my decisions making. 

- A good refresher on view modifyers: [link](https://www.hackingwithswift.com/quick-start/swiftui/how-to-get-custom-colors-and-transparency-with-sf-symbols)
- A good read on concurrency: [link](https://www.swiftbysundell.com/articles/the-main-actor-attribute/)
- Architectures: [link](https://medium.com/@icodingwithmaliha/decoding-ios-architecture-mvp-vs-mvc-vs-mvvm-vs-viper-fafa2d986f61)





