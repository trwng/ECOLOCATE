//
//  Volunteer.swift
//  project1
//
//  Created by Tara Wang on 10/19/24.
//

import SwiftUI

extension View {
    func customCornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(CustomRoundedCorner(radius: radius, corners: corners))
    }
}

struct CustomRoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct VolunteerView: View {
    var volunteers: [Volunteer] = [
        Volunteer(name: "John Doe", address: "123 Main St, Duluth", availability: "Available"),
        Volunteer(name: "Jane Smith", address: "456 Oak Ave, Duluth", availability: "Available"),
        Volunteer(name: "Sam Brown", address: "789 Pine Blvd, Duluth", availability: "Not Available")
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Find Your Volunteer")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()

                    ForEach(volunteers, id: \.self) { volunteer in
                        Button(action: {
                            // Do nothing when the button is tapped
                        }) {
                            VStack(alignment: .leading) {
                                Text(volunteer.name)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Text(volunteer.address)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(volunteer.availability)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color: .gray, radius: 4, x: 0, y: 2)
                            .padding(.bottom, 10)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Volunteers for You")
        }
    }
}

struct Volunteer: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var address: String
    var availability: String
}

#Preview {
    VolunteerView()
}
