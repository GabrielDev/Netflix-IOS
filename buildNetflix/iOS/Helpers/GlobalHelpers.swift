//
//  GlobalHelpers.swift
//  buildNetflix
//
//  Created by Gabriel dos Santos on 19/12/22.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/360/Big_Buck_Bunny_360_10s_1MB.mp4")!
let exampleVideoURL2 = URL(string: "https://test-videos.co.uk/vids/jellyfish/mp4/h264/360/Jellyfish_360_10s_1MB.mp4")!
let exampleVideoURL3 = URL(string: "https://test-videos.co.uk/vids/sintel/mp4/h264/360/Sintel_360_10s_1MB.mp4")!

let exampleImageURL = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/106")!

var randomImageURL: URL {
    return [exampleImageURL, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL
}

var randomVideoURL: URL {
    return [exampleVideoURL, exampleVideoURL2, exampleVideoURL3].randomElement() ?? exampleVideoURL
}

let exampleTrailer1 = Trailer(name: "Season 3 trailer", videoURL: randomVideoURL, thumbnailImageURL: randomImageURL)

let exampleTrailer2 = Trailer(name: "The Hero's Journey", videoURL: exampleVideoURL2, thumbnailImageURL: randomImageURL)

let exampleTrailer3 = Trailer(name: "The Mysterious", videoURL: exampleVideoURL3, thumbnailImageURL: randomImageURL)

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]

let episode1 = Episode(
    name: "Beginnings and Endings",
    season: 1,
    episodeNumber: 1,
    description: "Six months after the disapperances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event",
    length: 53,
    thumbnailImageURL: "https://picsum.photos/200/102",
    videoURL: exampleVideoURL
)

let episode2 = Episode(
    name: "Dark Matter",
    season: 1,
    episodeNumber: 2,
    description: "Clausen and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits an old nemesis.",
    length: 54,
    thumbnailImageURL: "https://picsum.photos/200/106",
    videoURL: exampleVideoURL2
)

let episode3 = Episode(
    name: "Ghosts",
    season: 1,
    episodeNumber: 3,
    description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again.",
    length: 53,
    thumbnailImageURL: "https://picsum.photos/200/103",
    videoURL: exampleVideoURL3
)

let episode4 = Episode(
    name: "Beginnings and Endings",
    season: 2,
    episodeNumber: 1,
    description: "Six months after the disapperances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event",
    length: 53,
    thumbnailImageURL: "https://picsum.photos/200/104",
    videoURL: randomVideoURL
)

let episode5 = Episode(
    name: "Dark Matter",
    season: 2,
    episodeNumber: 2,
    description: "Clausen and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits an old nemesis.",
    length: 54,
    thumbnailImageURL: "https://picsum.photos/200/105",
    videoURL: exampleVideoURL
)

let episode6 = Episode(
    name: "Ghosts",
    season: 3,
    episodeNumber: 3,
    description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again.",
    length: 53,
    thumbnailImageURL: "https://picsum.photos/200/107",
    videoURL: exampleVideoURL2
)

var allExampleEpisodes = [episode1, episode2, episode3, episode4, episode5, episode6]

let exampleMovie1 = Movie(
    id: UUID().uuidString,
    name: "Dark",
    thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    genre: .Thriller,
    year: 2020,
    rating: "TV-MA",
    accentColor: .blue,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hofman, Oliver Masucci, Jordis Triebel",
    previewImageName: "darkPreview",
    previewVideoURL: exampleVideoURL2,
    trailers: exampleTrailers,
    moreLikeThis: [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6, exampleMovie7],
    episodes: allExampleEpisodes,
    numberOfSeasons: 1
)

let exampleMovie2 = Movie(
    id: UUID().uuidString,
    name: "Travelers",
    thumbnailURL: URL(string: "https://picsum.photos/200/300/")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    genre: .Action,
    year: 2019,
    rating: "TV-MA",
    promotionHeadline: "Best Rated Show",
    accentColor: .yellow,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hofman, Oliver Masucci, Jordis Triebel",
    previewImageName: "travelersPreview",
    previewVideoURL: exampleVideoURL3,
    trailers: exampleTrailers,
    moreLikeThis: [],
    episodes: []
)

let exampleMovie3 = Movie(
    id: UUID().uuidString,
    name: "Arrested Development",
    thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    genre: .Comedy,
    year: 2018,
    rating: "TV-MA",
    promotionHeadline: "New episodes coming soon",
    accentColor: .orange,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hofman, Oliver Masucci, Jordis Triebel",
    previewImageName: "arrestedDevPreview",
    previewVideoURL: randomVideoURL,
    trailers: exampleTrailers,
    moreLikeThis: [],
    episodes: allExampleEpisodes,
    numberOfSeasons: 2
)

let exampleMovie4 = Movie(
    id: UUID().uuidString,
    name: "Dirty John",
    thumbnailURL: URL(string: "https://picsum.photos/200/302/")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    genre: .Horror,
    year: 2021,
    rating: "TV-MA",
    promotionHeadline: "Watch season 3 now",
    accentColor: .red,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hofman, Oliver Masucci, Jordis Triebel",
    previewImageName: "dirtyJohnPreview",
    previewVideoURL: exampleVideoURL,
    trailers: exampleTrailers,
    moreLikeThis: [exampleMovie2, exampleMovie3, exampleMovie7, exampleMovie5, exampleMovie6],
    episodes: allExampleEpisodes,
    numberOfSeasons: 3
)

let exampleMovie5 = Movie(
    id: UUID().uuidString,
    name: "White Lines",
    thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    genre: .Horror,
    year: 2020,
    rating: "TV-MA",
    accentColor: .white,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hofman, Oliver Masucci, Jordis Triebel",
    previewImageName: "whiteLinesPreview",
    previewVideoURL: exampleVideoURL2,
    trailers: exampleTrailers,
    moreLikeThis: [],
    episodes: allExampleEpisodes,
    numberOfSeasons: 2
)

let exampleMovie6 = Movie(
    id: UUID().uuidString,
    name: "Ozark",
    thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2021,
    rating: "TV-MA",
    accentColor: .yellow,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hofman, Oliver Masucci, Jordis Triebel",
    previewImageName: "ozarkPreview",
    previewVideoURL: exampleVideoURL3,
    trailers: exampleTrailers,
    moreLikeThis: []
)

let exampleMovie7 = Movie(
    id: UUID().uuidString,
    name: "After Life",
    thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
    categories: ["Dystopian", "Exciting", "Suspenseful", "Sci-Fi TV"],
    year: 2021,
    rating: "TV-MA",
    accentColor: .pink,
    defaultEpisodeInfo: exampleEpisodeInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hofman, Oliver Masucci, Jordis Triebel",
    previewImageName: "arrestedDevPreview",
    previewVideoURL: randomVideoURL,
    trailers: exampleTrailers,
    moreLikeThis: [],
    episodes: allExampleEpisodes,
    numberOfSeasons: 3
)

var exampleMovies: [Movie] {
    return [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]
}

let exampleEpisodeInfo1 = CurrentEpisodeInfomation(
    episodeName: "Beginnings and Endings",
    description: "Six months after the disapperances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event",
    season: 2,
    episode: 1
)

extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom
    )
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    /// ```
    /// Text("Label")
    ///     .isHidden(true)
    /// ```
    ///
    /// Example for complete removal:
    /// ```
    /// Text("Label")
    ///     .isHidden(true, remove: true)
    /// ```
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
