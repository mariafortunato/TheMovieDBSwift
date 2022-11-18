import Foundation

class DetailsViewModel {
    
    private let service = NetworkService()
    var model: Movie?
    var reload: (() -> Void)?
    
    func loadDetails(id: Int) {
        
        service.fetchMovieDetails(id: id) { result in
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
        return model?.title ?? ""
    }
    
    var image: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(model?.image ?? "")") ?? URL(fileURLWithPath: "")
    }
    
    var overview: String {
        return model?.overview ?? ""
    }
    
    var voteAverage: String {
        return "Classificação dos usuários: \(model?.voteAverage ?? 0)"
    }
}
