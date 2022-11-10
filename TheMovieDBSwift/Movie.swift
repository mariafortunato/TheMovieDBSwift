import Foundation

struct Movie {
    var id: Int
    var title: String
    var overview: String
    var releasedate: String
    var image: String
    var voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case releaseDate = "release_date"
        case image = "poster_path"
        case voteAverage = "vote_average"
    }
}
