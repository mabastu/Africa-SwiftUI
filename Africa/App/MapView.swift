//
//  MapView.swift
//  Africa
//
//  Created by Mabast on 3/30/21.
//

import MapKit
import SwiftUI

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        var mapCordinates = CLLocationCoordinate2D(latitude: 7.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCordinates, span: mapZoomLevel)
        return mapRegion
    }()

    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    var body: some View {
        // Map(coordinateRegion: $region)
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {
            item in
            // A) Old Style (Static)
            // MapPin(coordinate: item.location, tint: .red)

            // B) New Style (Static)
            // MapMarker(coordinate: item.location, tint: .red)

            // C) Custom Map Annotation (Could be Interactive)
            // MapAnnotation(coordinate: item.location) {
            //     Image("logo")
            //         .resizable()
            //         .scaledToFit()
            //         .frame(width: 32, height: 32, alignment: .center)
            // }

            // D) Custom Advanced Annotation
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        })
            .overlay(
                HStack(alignment: .center, spacing: 12) {
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                    VStack(alignment: .leading, spacing: 3) {
                        HStack {
                            Text("Latitude:")
                                .foregroundColor(.accentColor)
                                .font(.footnote)
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(region.center.latitude)")
                                .font(.footnote)
                                .fontWeight(.bold)
                        }
                        Divider()
                        HStack {
                            Text("Longitude:")
                                .foregroundColor(.accentColor)
                                .font(.footnote)
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .fontWeight(.bold)
                        }
                    }
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(Color.black)
                .cornerRadius(8)
                .opacity(0.6)
                .padding()
                , alignment: .top
            )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
