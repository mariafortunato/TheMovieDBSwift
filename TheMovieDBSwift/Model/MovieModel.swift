import Foundation

struct MovieModel: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    var id: Int?
    var title: String?
    var overview: String?
    var releaseDate: String?
    var image: String?
    var voteAverage: Double?
    
    private enum CodingKeys: String, CodingKey {
        case id, title, overview
        case releaseDate = "release_date"
        case image = "poster_path"
        case voteAverage = "vote_average"
    }
}
