import UIKit

class DetailsViewController: UIViewController {
    
    private let viewModel = DetailsViewModel()
    
    private lazy var titleMovie: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 32
        return image
    }()
    
    private lazy var voteAverage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var overview: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .justified
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = .white
    }
    
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
        view.addSubview(titleMovie)
        view.addSubview(image)
        view.addSubview(voteAverage)
        view.addSubview(overview)
        
    }
    
    private func setupConstraints() {
        titleMovie.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(-16)
            make.leading.equalTo(16)
        }
        
        image.snp.makeConstraints { make in
            make.top.equalTo(titleMovie.snp_bottomMargin).inset(-42)
            make.height.equalTo(264)
            make.width.equalTo(192)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        voteAverage.snp.makeConstraints { make in
            make.top.equalTo(image.snp_bottomMargin).inset(-42)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            
        }
        
        overview.snp.makeConstraints { make in
            make.top.equalTo(voteAverage.snp_bottomMargin).inset(-42)
            make.trailing.equalTo(-16)
            make.leading.equalTo(16)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "purple")
    }
    
    private func setupViewModel() {
        viewModel.loadDetails()
        DispatchQueue.main.async {
            self.titleMovie.text = self.viewModel.title
            self.image.sd_setImage(with: self.viewModel.image)
            self.voteAverage.text = self.viewModel.voteAverage
            self.overview.text = self.viewModel.overview
            self.overview.attributedText = NSAttributedString(string: self.viewModel.overview).withLineSpacing(8)
        }
    }
}
