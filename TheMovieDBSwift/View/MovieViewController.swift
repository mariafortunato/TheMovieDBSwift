import SDWebImage
import SnapKit
import UIKit

class MovieViewController: UIViewController {
    
let viewModel = NetworkViewModel()
    
    private lazy var titleTableView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial Bold", size: 24)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Filmes populares"
        return label
    }()
    
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
        view.addSubview(titleTableView)
        view.addSubview(tablewView)
    }
    
    private func setupConstraints() {
        
        titleTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalTo(view)
        }
        
        tablewView.snp.makeConstraints { make in
            make.top.equalTo(titleTableView.snp_bottomMargin).inset(-16)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
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
        cell?.image.sd_setImage(with: URL(string: model.image))
        
        return cell ?? UITableViewCell()
    }
}

extension MovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = DetailsViewController()
        
        navigationController?.pushViewController(details, animated: true)
    }
}
