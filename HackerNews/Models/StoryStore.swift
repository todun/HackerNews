//
//  StoryStore.swift
//  HackerNews
//
//  Created by Nathaniel Fredericks on 2019-06-09.
//  Copyright © 2019 Nathaniel Fredericks. All rights reserved.
//

import SwiftUI
import Combine

final class StoryStore: BindableObject {
    var didChange = PassthroughSubject<StoryStore, Never>()
    
    private(set) var stories = [Story]() {
        didSet { didChange.send(self) }
    }
    
    func fetchStories() {
        // TODO: Fetch stories from Hacker News API
        self.stories = testStories
    }
    
    init() {
        fetchStories()
    }
}
