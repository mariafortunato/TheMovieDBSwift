import Foundation


class DetailsViewModel {
    
    
    private let service = NetworkService()
    var model: MovieModel?
    var reload: (() -> Void)?
    
    func loadData() {
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
}
