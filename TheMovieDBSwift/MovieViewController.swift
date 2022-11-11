import SnapKit
import UIKit

class MovieViewController: UIViewController {
    

    
    private lazy var tablewView: UITableView = {
        let table = UITableView()
        
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor(named: "purple")
        table.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)

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
        view.backgroundColor = UIColor(named: "purple")
    }
}

extension MovieViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell
        cell?.setupInformations(title: movies[indexPath.row].title, releaseData: movies[indexPath.row].releaseDate)
        
        return cell ?? UITableViewCell()
    }
}

extension MovieViewController: UITableViewDelegate {
    
}
