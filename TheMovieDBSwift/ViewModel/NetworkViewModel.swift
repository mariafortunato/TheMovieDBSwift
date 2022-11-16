import Foundation

class NetworkViewModel {
    
    var movies: MovieModel?
    var reloadTableView: (() -> Void)?
    private let service = NetworkService()
    private var model = [MovieCellModel]() {
        didSet {
            self.reloadTableView?()
        }
    }
    
    func loadMovie() {
        service.fetchPopularMovies { result in
            switch result {
            case .success(let movies):
                self.createCell(movies: movies)
                self.reloadTableView?()
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func createCell(movies: MovieModel) {
        self.movies = movies
        var model = [MovieCellModel]()
        
        
        for movie in movies.results {
            model.append(MovieCellModel(
                id: movie.id ?? 0,
                title: movie.title ?? "",
                overview: movie.overview ?? "" ,
                releaseDate: "Lançamento: \(movie.releaseDate ?? "")" ,
                image: "https://image.tmdb.org/t/p/w500\(movie.image ?? "")",
                voteAverage: movie.voteAverage ?? 0
            )
            )
        }
        self.model = model
    }
    
    var numberOfCells: Int {
        return model.count
    }
    
    func getCell(index: IndexPath) -> MovieCellModel {
        return model[index.row]
    }
}

struct MovieCellModel {
    var id: Int
    var title: String
    var overview: String
    var releaseDate: String
    var image: String
    var voteAverage: Double
}
