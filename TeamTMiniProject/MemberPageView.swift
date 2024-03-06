//
//  MemberPageView.swift
//  TeamTMiniProject
//
//  Created by 김정호 on 2/29/24.
//

import UIKit
import SnapKit

final class MemberPageView: UIView {
    
    // MARK: - properties
    var memberInfo: MemberInfo? {
        didSet {
            profileImageView.image = memberInfo?.profileImage
            introductionLabel.text = memberInfo?.introduction
            memberNameLabel.text = memberInfo?.memberName
            memberMbtiLabel.text = memberInfo?.memberMbti
            memberBloodTypeLabel.text = memberInfo?.memberBloodType
            memberBirthdayLabel.text = memberInfo?.memberBirthday
            memberTechnologyLabel.text = memberInfo?.memberTechnology
            memberHopeFieldLabel.text = memberInfo?.memberHopeFieldLabel
            self.backgroundColor = memberInfo?.backgroundColor
        }
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    let introductionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        
        // 줄 간격을 조절할 attributed string 생성
        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        let lineHeight: CGFloat = 8.0 // 조절하고자 하는 줄 간격 값

        // NSMutableParagraphStyle을 사용하여 줄 간격 설정
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))

        // 라벨에 attributed string 설정
        label.attributedText = attributedString
        return label
    }()
    
    private let profileBasedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.text = "이름"
        return label
    }()
    
    private let mbtiLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.text = "MBTI"
        return label
    }()
    
    private let bloodTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.text = "혈액형"
        return label
    }()
    
    private let birthdayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.text = "생일"
        return label
    }()
    
    private let technologyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.text = "기술"
        return label
    }()
    
    private let hopeFieldLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.text = "희망분야"
        return label
    }()
    
    let memberNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    let memberMbtiLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    let memberBloodTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    let memberBirthdayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    let memberTechnologyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    let memberHopeFieldLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    private lazy var basedProfileStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, mbtiLabel, bloodTypeLabel, birthdayLabel, technologyLabel, hopeFieldLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    // MARK: - constructors
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - methods
    private func setUI() {
        self.backgroundColor = UIColor(red: 0, green: 103/255, blue: 163/255, alpha: 1)
    }
    
    private func setConstraints() {
        self.addSubview(profileImageView)
        self.addSubview(introductionLabel)
        self.addSubview(profileBasedView)
        self.profileBasedView.addSubview(basedProfileStackView)
        self.profileBasedView.addSubview(memberNameLabel)
        self.profileBasedView.addSubview(memberMbtiLabel)
        self.profileBasedView.addSubview(memberBloodTypeLabel)
        self.profileBasedView.addSubview(memberBirthdayLabel)
        self.profileBasedView.addSubview(memberTechnologyLabel)
        self.profileBasedView.addSubview(memberHopeFieldLabel)
        
        profileImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(15)
            $0.width.height.equalTo(120)
        }
        
        introductionLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.top.equalTo(profileImageView.snp.bottom).offset(25)
        }
        
        profileBasedView.snp.makeConstraints {
            $0.top.equalTo(introductionLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview().offset(-50)
        }
        
        basedProfileStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(40)
            $0.leading.equalToSuperview().inset(32)
        }
        
        memberNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel.snp.centerY)
            $0.leading.equalToSuperview().offset(140)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        memberMbtiLabel.snp.makeConstraints {
            $0.centerY.equalTo(mbtiLabel.snp.centerY)
            $0.leading.equalToSuperview().offset(140)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        memberBloodTypeLabel.snp.makeConstraints {
            $0.centerY.equalTo(bloodTypeLabel.snp.centerY)
            $0.leading.equalToSuperview().offset(140)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        memberBirthdayLabel.snp.makeConstraints {
            $0.centerY.equalTo(birthdayLabel.snp.centerY)
            $0.leading.equalToSuperview().offset(140)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        memberTechnologyLabel.snp.makeConstraints {
            $0.centerY.equalTo(technologyLabel.snp.centerY)
            $0.leading.equalToSuperview().offset(140)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        memberHopeFieldLabel.snp.makeConstraints {
            $0.centerY.equalTo(hopeFieldLabel.snp.centerY)
            $0.leading.equalToSuperview().offset(140)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
}
