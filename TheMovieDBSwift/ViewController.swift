import SnapKit
import UIKit

class ViewController: UIViewController {
    
    let movies: [Movie] = [

        Movie(id: 1, title: "Órfã 2: A Origem", overview: "2022-07-27", releasedate: "", image: "", voteAverage: 7.2),
        Movie(id: 2, title: "Minions 2: A Origem de Gru", overview: "2022-06-29", releasedate: "", image: "", voteAverage: 7.8),
        Movie(id: 3, title: "Thor: Amor e Trovão", overview: "2022-07-06", releasedate: "", image: "", voteAverage: 6.8),
        Movie(id: 4, title: "Avatar", overview: "2009-12-18", releasedate: "", image: "", voteAverage: 8.8),
    ]
    
    private lazy var tablewView: UITableView = {
        let table = UITableView()
        
        table.delegate = self
        table.dataSource = self
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFunctions()
        
        
    }
    
    private func setupFunctions() {
        setupUI()
        setupComponents()
        setupConstraints()
    }
    
    private func setupComponents() {
        view.addSubview(tablewView)
    }
    
    private func setupConstraints() {
        tablewView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .red
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = movies[indexPath.row].title
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}
