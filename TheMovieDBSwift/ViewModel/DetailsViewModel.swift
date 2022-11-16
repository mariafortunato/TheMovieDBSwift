import Foundation

class DetailsViewModel {
    
    private let service = NetworkService()
    var model: MovieModel?
    var reload: (() -> Void)?
    
    func loadDetails() {
            service.fetchPopularMovies { result in
                switch result {
                case .success(let success):
                    self.model = success
                    self.reload?()
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    
    
    var title: String {
        return model?.results[0].title ?? ""
    }
    
    var image: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(model?.results[0].image ?? "")") ?? URL(fileURLWithPath: "")
    }
    
    var overview: String {
        return model?.results[0].overview ?? ""
    }
    
    var voteAverage: String {
        return "Classificação dos usuários: \(model?.results[0].voteAverage ?? 0)"
    }
}
