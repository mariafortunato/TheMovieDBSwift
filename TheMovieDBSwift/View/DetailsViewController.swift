import UIKit

class DetailsViewController: UIViewController {
    
    private let viewModel = NetworkViewModel()
    
    private lazy var stackViewVertical: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        [titleMovie, image, voteAverage, overview].forEach { view in
            stack.addArrangedSubview(view)
        }
        return stack
    }()
    
    private lazy var titleMovie: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var voteAverage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var overview: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFunctions()
        
    }
    
    private func setupFunctions() {
        setupUI()
        setupComponents()
        setupConstraints()
        setupViewModel()
    }
    
    private func setupComponents() {
        view.addSubview(stackViewVertical)
        
    }
    
    private func setupConstraints() {
        stackViewVertical.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        image.snp.makeConstraints { make in
            make.height.equalTo(300)
            make.width.equalTo(300)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "purple")
    }
    
    private func setupViewModel() {
        viewModel.loadMovie()
        DispatchQueue.main.async {
            self.titleMovie.text = self.viewModel.title
            self.image.sd_setImage(with: self.viewModel.image)
            self.voteAverage.text = self.viewModel.voteAverage
            self.overview.text = self.viewModel.overview
        }
    }
    
}
