import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier: String = "CustomCell"
    
    private lazy var stackViewHorizontal: UIStackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 16
        return stack
    }()
    private lazy var stackViewVertical: UIStackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        return label
    }()
    
    private lazy var releaseData: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray4
        label.font = .systemFont(ofSize: 18.0, weight: .medium)
        return label
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "image")
        
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        setupFunctions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupFunctions() {
        setupComponents()
        setupConstraints()
    }
    
    private func setupComponents() {
        contentView.addSubview(stackViewHorizontal)
        stackViewHorizontal.addArrangedSubview(image)
        stackViewHorizontal.addArrangedSubview(stackViewVertical)
        stackViewVertical.addArrangedSubview(title)
        stackViewVertical.addArrangedSubview(releaseData)
        
    }
    
    private func setupConstraints() {
        stackViewHorizontal.snp.makeConstraints { make in
            make.top.bottom.leading.equalTo(contentView)
        }
    }
    
    func setupInformations(title: String, releaseData: String) {
//        self.image.image = UIImage(named: "image")
        self.title.text = title
        self.releaseData.text = "Lançamento: \(releaseData)"
    }

}
