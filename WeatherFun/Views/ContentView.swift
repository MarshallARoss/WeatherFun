//
//  ContentView.swift
//  WeatherFun
//
//  Created by Marshall  on 9/19/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        ZStack {
            VStack {
                if let location = locationManager.location {
                    if let weather = weather {
                        WeatherView(weather: weather)
                    } else {
                        LoadingView()
                            .task {
                                do {
                                    weather = try await weatherManager.getCurrentWeather(location: location)
                                } catch {
                                    print("Error getting weather \(error)")
                                }
                            }
                    }
                } else {
                    if locationManager.isLoading {
                        LoadingView()
                    }
                    else {
                        WelcomeView()
                            .environmentObject(locationManager)
                    }
                }
            }
        }
        .background(Color(hue: 0.639, saturation: 0.575, brightness: 0.484))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
