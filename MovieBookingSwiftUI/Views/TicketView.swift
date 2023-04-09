//
//  TicketView.swift
//  MovieBookingSwiftUI
//
//  Created by Brenda Saavedra  on 08/04/23.
//

import SwiftUI

struct TicketView: View {
    
    private let gradient: [Color] = [Color("backgroundColor"), Color("backgroundColor2")]
    @State var animate = false
    
    var body: some View {
        ZStack {
            CircleBackground(color: Color("greenCircle"))
                .blur(radius: animate ? 30 : 100)
                .offset(x: -130, y: -100)
            
            CircleBackground(color: Color("pinkCircle"))
                .blur(radius: 100)
                .offset(x:130, y:100)
            
            VStack(spacing: 30) {
                Text("Mobile Ticket")
                    .font(.title3)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Text("Once you buy a movie ticket simply scan the barcode to acces to your movie.")
                    .font(.body)
                    .foregroundColor(.white)
                    .frame(maxWidth: 248)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .background(
            LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
        )
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
