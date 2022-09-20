//
//  WeatherView.swift
//  WeatherFun
//
//  Created by Marshall  on 9/20/22.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack{
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            
                            VStack(alignment: .leading) {

                                AsyncImage(url: weather.weather[0].mediumIconURL) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                    default:
                                        ProgressView()
                                    }
                                }
                                .frame(maxWidth: 150, maxHeight: 100)

                                
                                Text(weather.weather[0].main)
                            }

                            Spacer()
                            
                            Text(weather.main.feelsLike.roundDoubleDegree())
                                .font(.system(size: 100))
                                .fontWeight(.bold)
                                .padding()
                    }
                        
                    Spacer()

                }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather Now")
                        .bold().padding(.bottom)
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: weather.main.tempMin.roundDoubleDegree())
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: weather.main.tempMax.roundDoubleDegree())
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + "mph")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + "%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.639, saturation: 0.575, brightness: 0.484))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.639, saturation: 0.575, brightness: 0.484))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
            
    }
}
