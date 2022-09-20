//
//  MapView.swift
//  WeatherFun
//
//  Created by Marshall  on 9/20/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    var weather: ResponseBody
    @State var region: MKCoordinateRegion
    
    init(weather: ResponseBody) {
        self.weather = weather
        let location = CLLocationCoordinate2D(latitude: weather.coord.lat, longitude: weather.coord.lon)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 20000.0, longitudinalMeters: 20000.0)
        _region = State(wrappedValue: region)
    }
   
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .zoom, showsUserLocation: true)
    }
}

struct MapView_Previews: PreviewProvider {
   
    static var previews: some View {
       MapView(weather: previewWeather)
    }
}
