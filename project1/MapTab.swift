import MapKit
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct MapTab: View {
    
    let locations = [
        Location(name: "House 1", coordinate: CLLocationCoordinate2D(latitude: 33.94688, longitude: -84.06150)),
        Location(name: "House 2", coordinate: CLLocationCoordinate2D(latitude: 33.05550, longitude: -85.01195)),
        Location(name: "House 3", coordinate: CLLocationCoordinate2D(latitude: 33.37718, longitude: -82.10794))
    ]
    
    let recyclingCenters = [
        Location(name: "Old Atlanta Recycling Convenience Center", coordinate: CLLocationCoordinate2D(latitude: 34.10114, longitude: -84.13857)),
        Location(name: "Clayton County Recycling Center", coordinate: CLLocationCoordinate2D(latitude: 33.53923, longitude: -84.34396)),
        Location(name: "Merk Miles Citizens Convenience Center", coordinate: CLLocationCoordinate2D(latitude: 33.66860, longitude: -84.56729)),
        Location(name: "Columbia County Recycling Center", coordinate: CLLocationCoordinate2D(latitude: 33.49444, longitude: -82.22921)),
        Location(name: "Chatham County Resource Conservation & Recycling Education Center", coordinate: CLLocationCoordinate2D(latitude: 32.00487, longitude: -81.09611)),
        Location(name: "Brent Center", coordinate: CLLocationCoordinate2D(latitude: 32.97824, longitude: -84.00528)),
        Location(name: "Waste Management Pine Grove Collection Center", coordinate: CLLocationCoordinate2D(latitude: 30.94086, longitude: -83.24063)),
        Location(name: "Columbus Recycling & Sustainability Center", coordinate: CLLocationCoordinate2D(latitude: 32.49035, longitude: -84.84981))
    ]
    
    let position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 32.8126, longitude: -83.3),
            span: MKCoordinateSpan(latitudeDelta: 5.5, longitudeDelta: 5.5)
        )
    )
    
    var body: some View {
        Map(initialPosition: position) {
            ForEach(locations) { location in
                Marker(location.name, coordinate: location.coordinate)
            }
            ForEach(recyclingCenters) { location in
                Marker(location.name, coordinate: location.coordinate)
                    .tint(.green)
            }
        }
        .navigationTitle("Map") // Ensure navigation title is set
    }
}

#Preview {
    MapTab()
}
