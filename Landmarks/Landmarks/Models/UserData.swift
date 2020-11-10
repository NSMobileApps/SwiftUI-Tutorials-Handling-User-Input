//
//  UserData.swift
//  Landmarks
//
//  Created by Naoyuki TAKAHASHI on 2020/11/10.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI
import Combine // Combine を import

// ObservableObject に準拠
final class UserData: ObservableObject {
    // stored proeprty `showFavoritesOnly`, `landmark` を追加し、初期値を設定
    // @Published 属性を付与し、変更を購読できるように
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}


