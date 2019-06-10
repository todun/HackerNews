//
//  StoryStore.swift
//  HackerNews
//
//  Created by Nathaniel Fredericks on 2019-06-09.
//  Copyright © 2019 Nathaniel Fredericks. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class StoryStore: BindableObject {
    var didChange = PassthroughSubject<StoryStore, Never>()
    
    private(set) var stories = [Story]() {
        didSet { didChange.send(self) }
    }
    
    func fetchStories(feed: FeedType) {
        let hackerNewsService = HackerNewsService()
        
        hackerNewsService.fetchStories(feed: feed) { (stories, error) in
            guard error == nil else {
                return
            }
            
            guard let stories = stories else {
                return
            }
            
            self.stories = stories
        }
    }
    
    init() {
        fetchStories(feed: .top)
    }
}
