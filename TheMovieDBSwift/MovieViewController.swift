import Kingfisher
import SnapKit
import UIKit

class MovieViewController: UIViewController {
    
let viewModel = NetworkViewModel()
    
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
        configViewModel()
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
    
    private func configViewModel() {
        viewModel.loadMovie()
        viewModel.reloadTableView = {
            DispatchQueue.main.async {
                self.tablewView.reloadData()
            }
        }
    }
}

extension MovieViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell
        
        let model = viewModel.getCell(index: indexPath)
        cell?.title.text = model.title
        cell?.releaseData.text = model.releaseDate
        cell?.image.conf
        
        return cell ?? UITableViewCell()
    }
}

extension MovieViewController: UITableViewDelegate {
    
}
