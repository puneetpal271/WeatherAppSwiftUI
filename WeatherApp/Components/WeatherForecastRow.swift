//
//  WeatherForecastRow.swift
//  WeatherApp
//
//  Created by Puneetpal Singh on 10/30/23.
//

import SwiftUI

struct WeatherForecastRow: View {
    var icon: String
    var date: String
    var description: String
    var minTemp: String
    var maxTemp: String

    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text(date)
                    .font(.caption)
            }
            AsyncImage(
                url: URL(string: "https://openweathermap.org/img/wn/{IMAGENAME}@2x.png".replacingOccurrences(of: "{IMAGENAME}", with:icon)),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .cornerRadius(50)
                },
                placeholder: {
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
                
            )
            VStack(alignment: .leading, spacing: 10) {
                Text(description)
                    .font(.caption)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(minTemp)
                    .bold()
                    .font(.title)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(maxTemp)
                    .bold()
                    .font(.title)
            }
        }
    }
}

struct WeatherForecastRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastRow(icon: "cloud", date: "Today", description: "Feels like",minTemp: "8", maxTemp: "10")
    }
}
