import Foundation

class NetworkService {
    
    private func getAPIKey() -> String? {
        var keys: NSDictionary?
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
            return keys?["apiKey"] as? String
        }
        return nil
    }
    
    private func getURLPopularMovies() -> String {
        guard let APIKey = getAPIKey() else { return String() }
        return "https://api.themoviedb.org/3/movie/popular?api_key=\(APIKey)&language=pt-BR&page=1"
    }
    
    func fetchPopularMovies(completion: @escaping (Result<MovieModel, Error>) -> Void) {
        
        guard let url = URL(string: getURLPopularMovies()) else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("status code: ", response.statusCode)
            }
            
            guard let data = data else { return }
            
            do {
                let movie = try JSONDecoder().decode(MovieModel.self, from: data)
                completion(.success(movie))
            } catch {
                completion(.failure(error))
            }
            
            
        }.resume()
    }
}
