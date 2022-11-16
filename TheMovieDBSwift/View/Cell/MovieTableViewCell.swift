import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier: String = "CustomCell"
    
    private lazy var stackViewMain: UIStackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.spacing = 16
        stack.alignment = .center
        stack.axis = .horizontal
        [image, stackViewTexts].forEach { view in
            stack.addArrangedSubview(view)
        }
        return stack
    }()
    private lazy var stackViewTexts: UIStackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        [title, releaseData].forEach { view in
            stack.addArrangedSubview(view)
        }
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private(set) lazy var title: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private(set) lazy var releaseData: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray4
        label.font = .systemFont(ofSize: 18.0, weight: .medium)
        return label
    }()
    
    private(set) lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 18.0
        image.layer.masksToBounds = true
        image.backgroundColor = .red
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
       addSubview(stackViewMain)        
    }
    
    private func setupConstraints() {
        stackViewMain.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.bottom.equalTo(-16)
            make.leading.equalTo(24)
            make.trailing.equalTo(-24)
        }
        
        image.snp.makeConstraints { make in
            make.height.equalTo(120)
            make.width.equalTo(90)
        }
    }
}
