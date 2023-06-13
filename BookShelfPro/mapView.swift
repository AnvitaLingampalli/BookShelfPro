import SwiftUI
import CoreLocation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct mapView: View {

    
    @State private static var defaultLocation = CLLocationCoordinate2D(
        latitude: 33.4255,
        longitude: -111.9400
    )
    
    // state property that represents the current map region
    @State private var region = MKCoordinateRegion(
        center: defaultLocation,
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    // state property that stores marker locations in current map region
    //    @State private var markers = [
    //        Location(name: "Tempe", coordinate: defaultLocation)
    //    ]
    @State private var markers: [Location] = []
    @Environment(\.dismiss) private var dismiss
    @State var address:String
   
    //@ObservedObject  var cModel : cityViewModel
    
    
    var body: some View {
        VStack{
            TextField("Enter a place", text: $address)
            Button{
                forwardGeocoding(addressStr: address)
            }label: {
                Text("Get Map")
            }
            Button{
                searchBar()
            }label: {
                Text("Get Bookstore Locations")
            }
            Map(coordinateRegion: $region,
                interactionModes: .all,
                annotationItems: markers
            ){ location in
                MapAnnotation(coordinate: location.coordinate){
                    Text(location.name)
                    Image(systemName: "mappin.circle.fill")
                        .font(.title)
                        .foregroundColor(.red)
                    Image(systemName: "arrowtriangle.down.fill")
                        .font(.caption)
                        .foregroundColor(.red)
                        .offset(x: 0, y: -5)
                }
            }
        }
    }
    @State private var searchText = "bookstore"
    func searchBar (){
        
                let searchRequest = MKLocalSearch.Request()
                searchRequest.naturalLanguageQuery = searchText
                searchRequest.region = region
                
                MKLocalSearch(request: searchRequest).start { response, error in
                    guard let response = response else {
                        print("Error: \(error?.localizedDescription ?? "Unknown error").")
                        return
                    }
                    region = response.boundingRegion
                    markers = response.mapItems.map { item in
                        Location(
                            
                            name: item.name ?? "",
                            coordinate: item.placemark.coordinate
                        )
                    }
                }
    }
    
    func forwardGeocoding(addressStr: String)
    {
        
        let geoCoder = CLGeocoder();
        let addressString = addressStr
        CLGeocoder().geocodeAddressString(addressString, completionHandler:
                                            {(placemarks, error) in
            
            if error != nil {
                print("Geocode failed: \(error!.localizedDescription)")
            } else if placemarks!.count > 0 {
                let placemark = placemarks![0]
                let location = placemark.location
                let coords = location!.coordinate
//                lat = coords.latitude
//                lon = coords.longitude
                
                DispatchQueue.main.async
                    {
                        region.center = coords
//                        markers[0].name = placemark.locality ?? city
//                        markers[0].coordinate = coords
                    }
            }
        })
    }
}
