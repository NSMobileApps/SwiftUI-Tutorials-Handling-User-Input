/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI

struct LandmarkList: View {
    // @State property `showFavoritesOnly` を追加し、初期値を false に
//    @State var showFavoritesOnly = false
    // `showFavoritesOnly` を `@EnvironmentObject` property に置き換え
    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView {
            List {
                // List の first child として Toggle を追加
                // 引数に showFavoritesOnly を指定し `$` を付与することで binding する
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                // ForEach group を作成
                ForEach(userData.landmarks) { landmark in
                    // Filter を追加
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
            // こちらも environmentObject(_:) modifier に置き換え
                .environmentObject(UserData())
        }
    }
}
