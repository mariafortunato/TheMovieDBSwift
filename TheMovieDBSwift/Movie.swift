import Foundation

struct Movie {
    var id: Int
    var title: String
    var overview: String
    var releaseDate: String
    var image: String
    var voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case releaseDate = "release_date"
        case image = "poster_path"
        case voteAverage = "vote_average"
    }
}

let movies: [Movie] = [

    Movie(id: 1, title: "Órfã 2: A Origem", overview: "", releaseDate: "27/09/22", image: "", voteAverage: 7.2),
    Movie(id: 2, title: "Minions 2: A Origem de Gru", overview: "", releaseDate: "30/06/22", image: "", voteAverage: 7.8),
    Movie(id: 3, title: "Thor: Amor e Trovão", overview: "", releaseDate: "07/07/22", image: "", voteAverage: 6.8),
    Movie(id: 4, title: "Avatar", overview: "", releaseDate: "18/12/09", image: "", voteAverage: 8.8),
]
