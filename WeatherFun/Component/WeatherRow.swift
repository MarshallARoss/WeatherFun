//
//  WeatherRow.swift
//  WeatherFun
//
//  Created by Marshall  on 9/20/22.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(.gray)
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 8) {
                    Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
       WeatherRow(logo: "thermometer", name: "feels like ", value: "8")
    }
}
