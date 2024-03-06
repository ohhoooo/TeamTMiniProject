//
//  MemberPageViewController.swift
//  TeamTMiniProject
//
//  Created by 김정호 on 2/29/24.
//

import UIKit

final class MemberPageViewController: UIViewController {
    
    // MARK: - properties
    var name: String?
    
    let memberPageView = MemberPageView()
    
    // MARK: - lifecycle
    override func loadView() {
        view = memberPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData(name)
        setNavigation()
    }

    // MARK: - methods
    private func setData(_ name: String?) {
        switch name {
        case "염아현":
            memberPageView.memberInfo = MemberInfo(profileImage: UIImage(resource: .characterCircleAhyeon),
                                                   introduction: "조금 작더라도\n꾸준한 발자취를 남기는\n개발자가 되겠습니다.",
                                                   memberName: "염아현",
                                                   memberMbti: "ENTJ",
                                                   memberBloodType: "A형",
                                                   memberBirthday: "1217",
                                                   memberTechnology: "C, Java, Python",
                                                   memberHopeFieldLabel: "소셜, OTT",
                                                   backgroundColor: UIColor(red: 164/255, green: 14/255, blue: 14/255, alpha: 1))
        case "배지해":
            memberPageView.memberInfo = MemberInfo(profileImage: UIImage(resource: .characterCircleJihae),
                                                   introduction: "상상력을 실현하는\n예비 iOS 개발자\n배지해입니다.",
                                                   memberName: "배지해",
                                                   memberMbti: "ISTP",
                                                   memberBloodType: "A형",
                                                   memberBirthday: "0117",
                                                   memberTechnology: "C, C++, Java, UIkit, swift",
                                                   memberHopeFieldLabel: "소셜미디어, 게임",
                                                   backgroundColor: UIColor(red: 255/255, green: 164/255, blue: 179/255, alpha: 1))
        case "윤소연":
            memberPageView.memberInfo = MemberInfo(profileImage: UIImage(resource: .characterCircleSoyeon),
                                                   introduction: "잘 배우고 갑니다’를 외치고\n떠날 수 있도록 최선을 다해\n노력하겠습니다.",
                                                   memberName: "윤소연",
                                                   memberMbti: "INTP",
                                                   memberBloodType: "B형",
                                                   memberBirthday: "0912",
                                                   memberTechnology: "React, React-native, Flutter",
                                                   memberHopeFieldLabel: "금융",
                                                   backgroundColor: UIColor(red: 36/255, green: 62/255, blue: 53/255, alpha: 1))
        case "김정호":
            memberPageView.memberInfo = MemberInfo(profileImage: UIImage(resource: .characterCircleJeongho),
                                                   introduction: "취업하고 싶어서 온 만큼\n최선을 다해서\n나아가겠습니다~!",
                                                   memberName: "김정호",
                                                   memberMbti: "INTJ",
                                                   memberBloodType: "A형",
                                                   memberBirthday: "0917",
                                                   memberTechnology: "Android, iOS, Java, kotlin, Swift",
                                                   memberHopeFieldLabel: "서비스",
                                                   backgroundColor: UIColor(red: 0, green: 103/255, blue: 163/255, alpha: 1))
        case "송정훈":
            memberPageView.memberInfo = MemberInfo(profileImage: UIImage(resource: .characterCicleJeonghoon),
                                                   introduction: "열심히가 아닌\n잘하는 사람이 되겠습니다.",
                                                   memberName: "송정훈",
                                                   memberMbti: "INTP",
                                                   memberBloodType: "B형",
                                                   memberBirthday: "0324",
                                                   memberTechnology: "C",
                                                   memberHopeFieldLabel: "소셜미디어, 금융",
                                                   backgroundColor: UIColor(red: 255/255, green: 212/255, blue: 0, alpha: 1))
        default:
            print("잘못 전달 됨.")
        }
    }
    
    private func setNavigation() {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = ""
        
        let naviRightButton = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(didTapInfoButton))
        self.navigationItem.rightBarButtonItem = naviRightButton
    }
    
    @objc private func didTapInfoButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let memberDetailsVC = storyboard.instantiateViewController(withIdentifier: "MemberDetailsViewController") as? MemberDetailsViewController {
            memberDetailsVC.nameData = name
            self.present(memberDetailsVC, animated: true)
        } else {
            print("실패하였습니다.")
        }
    }
}
