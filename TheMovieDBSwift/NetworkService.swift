import Foundation

class NetworkService {
    //
    func fetchPopularMovies(completion: @escaping (Result<MovieModel, Error>) -> Void) {
        let token = "e78fae94bef75da06acade5b8fbc21a9"
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(token)&language=pt-BR") else { return }
        
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("status code: ", response.statusCode)
            }
            
            guard let data = data else { return }
            
            do {
                let movie = try JSONDecoder().decode(MovieModel.self, from: data)
                completion(.success(movie))
                print(movie.results)
            } catch {
                completion(.failure(error))
            }
            
            
        }.resume()
    }
}
