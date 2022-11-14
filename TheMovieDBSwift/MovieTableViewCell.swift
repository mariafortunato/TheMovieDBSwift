import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier: String = "CustomCell"
    
    private lazy var stackViewMain: UIStackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 16
        return stack
    }()
    private lazy var stackViewTexts: UIStackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private(set) lazy var title: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
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
        contentView.addSubview(stackViewMain)
        stackViewMain.addArrangedSubview(image)
        stackViewMain.addArrangedSubview(stackViewTexts)
        stackViewTexts.addArrangedSubview(title)
        stackViewTexts.addArrangedSubview(releaseData)
        
    }
    
    private func setupConstraints() {
        stackViewMain.snp.makeConstraints { make in
            make.top.bottom.leading.equalTo(contentView)
        }
        
//        image.snp.makeConstraints { make in
//            make.height.equalTo(120)
//            make.width.equalTo(90)
//        }
    }
}
