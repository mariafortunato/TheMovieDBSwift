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
        return "https://api.themoviedb.org/3/movie/popular?api_key=\(APIKey)&language=pt-BR"
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
    
    func fetchMovieDetails(id: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=\(getAPIKey() ?? "")&language=pt-BR") else { return }
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else { return }
                do {
                    let movies = try JSONDecoder().decode(Movie.self, from: data)
                    completion(.success(movies))
                } catch let error {
                    completion(.failure(error))
                }
            }.resume()
        }
}
