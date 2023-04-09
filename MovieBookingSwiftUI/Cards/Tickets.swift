//
//  Tickets.swift
//  MovieBookingSwiftUI
//
//  Created by Brenda Saavedra  on 08/04/23.
//

import SwiftUI

struct Tickets: View {
    @State var tickets: [TicketModel] = [
        TicketModel(image: "thor", title: "Thor", subtitle: "Love and Thunder", top: "thor-top", bottom: "thor-bottom"),
        TicketModel(image: "panther", title: "Black Panther", subtitle: "Wakanda Forever", top: "panther-top", bottom: "panther-bottom"),
        TicketModel(image: "scarlet", title: "Doctor Strange", subtitle: "in the Multiverse of Madness", top: "scarlet-top", bottom: "scarlet-bottom")
    ]
    
    var body: some View {
        ZStack {
            ForEach(tickets) { ticket in
                InfiniteStackView(tickets: $tickets, ticket: ticket)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct Tickets_Previews: PreviewProvider {
    static var previews: some View {
        Tickets()
    }
}

struct InfiniteStackView: View {
    @Binding var tickets: [TicketModel]
    var ticket: TicketModel
    
    @State var height: CGFloat = 0
    
    var body: some View {
        VStack {
            Ticket(
                title: ticket.title, subtitle: ticket.subtitle, top: ticket.top, bottom: ticket.bottom,
                height: $height)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .zIndex(Double(CGFloat(tickets.count) - getIndex()))
    }
    
    func getIndex() -> CGFloat {
        let index = tickets.firstIndex{ ticket in
            return self.ticket.id == ticket.id
        } ?? 0
        
        return CGFloat(index)
    }
}
