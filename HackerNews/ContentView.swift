//
//  ContentView.swift
//  HackerNews
//
//  Created by Nathaniel Fredericks on 2019-06-09.
//  Copyright © 2019 Nathaniel Fredericks. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    enum FeedType: String, CaseIterable {
        case top = "Top"
        case new = "New"
        case best = "Best"
    }
    
    @ObjectBinding var store = StoryStore()
    @State var feedType: FeedType = .top
    
    var body: some View {
        NavigationView {
            List {
                SegmentedControl(selection: $feedType) {
                    ForEach(FeedType.allCases.identified(by: \.self)) { type in
                        Text(type.rawValue)
                    }
                }
                
                ForEach(store.stories) { story in
                    NavigationButton(destination: Text("")) {
                        StoryRow(story: story)
                    }
                }
            }
            .navigationBarTitle(Text("Hacker News"))
            .navigationBarItems(trailing: Button(action: {
                self.store.fetchStories(feed: self.$feedType.value)
            }) {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(.blue)
                    .accessibility(label: Text("Reload"))
                }
            )
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
