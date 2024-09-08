# Stocks. Cash App 

A simple app that displays a list of stocks. 

## App Description

This app displays a list of stock symbols and prices for a set of stocks parsed from a provided JSON endpoint. 
The app is able to handle loading, errors and empty states.

## Getting started 
1. Make sure you have the Xcode verion 14.0 or above instaalled on your computer 
2. Clone the `Stocks` project from the repository into the directory of your choice.
3. Open and run the project 

After these steps you should see a screen displaying a simple list of stocks 

## Architecture

- `Stocks` is implemented using the Model-View-ViewModel (MVVM) architecture pattern. 
- The model has the nessesary data bussiness logic needed to access the data the app needs to display.
- The view model is responsible to get the data provided from the model and handle the different states the data can provide. The model is also responsible with providing the view a stable way to display the data.
- The view displays the data. 
- The app doesn't have any user interface.

# TODO: 

- Write documentation on running tests
- API 
- Inspiration for UI 
- Helping articles 





