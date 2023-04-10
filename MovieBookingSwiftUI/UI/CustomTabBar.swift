//
//  CustomTabBar.swift
//  MovieBookingSwiftUI
//
//  Created by Brenda Saavedra  on 10/04/23.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var currentTab: Tab
    
    var body: some View {
        HStack(spacing: 0){
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Button {
                    withAnimation(.easeOut) {
                        currentTab = tab
                    }
                } label: {
                    Image(tab.rawValue)
                        .renderingMode(.template)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(.red)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
