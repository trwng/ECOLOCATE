import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ContentView: View {
    @State private var selectedTab = 0 

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                ScrollView {
                    VStack {
                        Button(action: {
                            
                            selectedTab = 1
                        }) {
                            VStack(spacing: 0) {
                                Text("Where can you recycle?")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .frame(width: 370, height: 60)
                                    .background(Color.white)
                                    .cornerRadius(15, corners: [.topLeft, .topRight])

                                ZStack {
                                    Color.green
                                        .frame(width: 370, height: 120)
                                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])

                                    Image("map") 
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 370, height: 120)
                                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                                        .clipped() 
                                }
                            }
                            .frame(width: 370, height: 185)
                        }
                        .shadow(color: .gray, radius: 4, x: 0, y: 2)

                       
                        Button(action: {
                            print("Button tapped")
                        }) {
                            VStack(alignment: .leading, spacing: 10) {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Columbia County Recycling Ce...")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    HStack {
                                        Text("1960 William Few Pkwy, Groveway, GA, 30090")
                                    }
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    
                                    Text("Open · 11:00 AM – 11:00 PM")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding()

                                Image("restaurant_image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 10)
                                    .clipped()
                                    .cornerRadius(10)
                            }
                            .background(Color.white)
                            .cornerRadius(15)
                            .frame(width: 370, height: 130)
                            .shadow(color: .gray, radius: 4, x: 0, y: 2)
                        }
                        .padding(.bottom, 0.5)

                        Button(action: {
                            print("Button tapped")
                        }) {
                            VStack(alignment: .leading, spacing: 10) {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Rockdale County Recycling Center")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    HStack {
                                        Text("1200 Sigman RD NE, Conyers, GA, 30012")
                                    }
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    
                                    Text("Open · 11:00 AM – 11:00 PM")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding()

                                Image("restaurant_image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 10)
                                    .clipped()
                                    .cornerRadius(10)
                            }
                            .background(Color.white)
                            .cornerRadius(15)
                            .frame(width: 370, height: 130)
                            .shadow(color: .gray, radius: 4, x: 0, y: 2)
                        }
                        .padding(.bottom, 0.5)
                        
                        Text("No transport, no worries!")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top)
                            .padding(.horizontal)
                            .padding(.bottom, 0.5)
                        Text("Trusted Volunteers")
                        
                        HStack {
                            ForEach(1...3, id: \.self) { number in
                                VStack {
                                    Button(action: {
                                        print("Circle button \(number) tapped")
                                    }) {
                                        Text("\(number)")
                                            .foregroundColor(.white)
                                            .frame(width: 120, height: 100)
                                            .background(Color.white)
                                            .clipShape(Circle())
                                    }
                                    .shadow(color: .gray, radius: 4, x: 0, y: 2)
                                    
                                    Text("Name \(number)")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .padding(.top)

                        VStack {
                            Text("Our volunteers...")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.top)
                                .padding(.horizontal)
                                .padding(.bottom, 0.5)
                                
                            
                            Text("Our volunteers are what make us. They provide their time to transport your recyclable trash to their nearest recycling center.")
                                .font(.body)
                                .padding(.top)
                                .padding(.horizontal)
                        }
                    }
                    .padding()
                }
                .navigationTitle("Do your part, recycle.")
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tag(0) 

            MapTab() 
                .tabItem {
                    Image(systemName: "mappin")
                    Text("Map")
                }
                .tag(1)
            
            VolunteerView()
                .tabItem {
                    Image(systemName: "person.3") 
                    Text("Volunteers")
                }
                .tag(2) 
        }
    }
}

#Preview {
    ContentView()
}
