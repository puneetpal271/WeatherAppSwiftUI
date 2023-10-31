//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Puneetpal Arneja on 10/29/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody

    var body: some View {
        ZStack(alignment: .leading) {
            ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            AsyncImage(
                                url: URL(string: "https://openweathermap.org/img/wn/{IMAGENAME}@2x.png".replacingOccurrences(of: "{IMAGENAME}", with:weather.weather[0].icon)),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 200, maxHeight: 100)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                            Text("\(weather.weather[0].description)")
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + ("°")))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                Spacer()
            }
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("5 Days Forecast")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherForecastRow(icon: weather.weather[0].icon, date: (Date().formatted(.dateTime.month().day())), description: weather.weather[0].description, minTemp: (weather.main.tempMin.roundDouble() + ("°")), maxTemp: (weather.main.tempMax.roundDouble() + ("°")))
                    }
                    HStack {
                        WeatherForecastRow(icon: weather.weather[0].icon, date: (Date().formatted(.dateTime.month().day())), description: weather.weather[0].description, minTemp: (weather.main.tempMin.roundDouble() + ("°")), maxTemp: (weather.main.tempMax.roundDouble() + ("°")))
                    }
                    HStack {
                        WeatherForecastRow(icon: weather.weather[0].icon, date: (Date().formatted(.dateTime.month().day())), description: weather.weather[0].description, minTemp: (weather.main.tempMin.roundDouble() + ("°")), maxTemp: (weather.main.tempMax.roundDouble() + ("°")))
                    }
                    HStack {
                        WeatherForecastRow(icon: weather.weather[0].icon, date: (Date().formatted(.dateTime.month().day())), description: weather.weather[0].description, minTemp: (weather.main.tempMin.roundDouble() + ("°")), maxTemp: (weather.main.tempMax.roundDouble() + ("°")))
                    }
                    
                    HStack {
                        WeatherForecastRow(icon: weather.weather[0].icon, date: (Date().formatted(.dateTime.month().day())), description: weather.weather[0].description, minTemp: (weather.main.tempMin.roundDouble() + ("°")), maxTemp: (weather.main.tempMax.roundDouble() + ("°")))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
    }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.487, brightness: 0.654))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
