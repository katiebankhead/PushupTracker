//
//  ContentView.swift
//  PushupTracker
//
//  Created by Katie Bankhead on 10/26/21.
//

import SwiftUI

struct ContentView: View {
    private struct HundredPushups {
        static let url = "https://hundredpushups.com".url
    }
    
    var body: some View {
        TabView {
            PushupRecordView()
                .tabItem {
                    Image(systemName: "list.dash")
                        .imageScale(.large)
                    Text("Pushups")
                }
            WebView(request: URLRequest(url: HundredPushups.url))
                .tabItem {
                    Image(systemName: "globe")
                        .imageScale(.large)
                    Text("HundredPushups.com")
                }
        }
    }
}

struct PushupRecordView: View {
    var body: some View {
        Text("PushupRecordView")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
