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
    
    func fetchStories(feed: ContentView.FeedType) {
        let hackerNewsService = HackerNewsService()

        switch feed {
        case .top:
            hackerNewsService.fetchStories(feed: .top) { (stories, error) in
                guard error == nil else {
                    return
                }
                
                guard let stories = stories else {
                    return
                }
                
                self.stories = stories
            }
        case .new:
            hackerNewsService.fetchStories(feed: .new) { (stories, error) in
                guard error == nil else {
                    return
                }
                
                guard let stories = stories else {
                    return
                }
                
                self.stories = stories
            }
        case .best:
            hackerNewsService.fetchStories(feed: .best) { (stories, error) in
                guard error == nil else {
                    return
                }
                
                guard let stories = stories else {
                    return
                }
                
                self.stories = stories
            }
        }
    }
    
    init() {
        fetchStories(feed: .top)
    }
}
