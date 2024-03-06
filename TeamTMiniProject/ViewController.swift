//
//  ViewController.swift
//  MiniProjectSecondPage
//
//  Created by A Hyeon on 2/27/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var YAH_btn: UIButton!
    @IBOutlet weak var BJH_btn: UIButton!
    @IBOutlet weak var YSY_btn: UIButton!
    @IBOutlet weak var KJH_btn: UIButton!
    @IBOutlet weak var SJH_btn: UIButton!
    @IBOutlet weak var TeamIntroduce_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClick_YAH_btn(_ sender: Any) {
        let memberPageViewController = MemberPageViewController()
        memberPageViewController.name = "염아현"
        self.navigationController?.pushViewController(memberPageViewController, animated: true)
    }
    
    @IBAction func onClick_BJH_btn(_ sender: Any) {
        let memberPageViewController = MemberPageViewController()
        memberPageViewController.name = "배지해"
        self.navigationController?.pushViewController(memberPageViewController, animated: true)
    }
    
    @IBAction func onClick_YSY_btn(_ sender: Any) {
        let memberPageViewController = MemberPageViewController()
        memberPageViewController.name = "윤소연"
        self.navigationController?.pushViewController(memberPageViewController, animated: true)
    }
    
    @IBAction func onClick_KJH_btn(_ sender: Any) {
        let memberPageViewController = MemberPageViewController()
        memberPageViewController.name = "김정호"
        self.navigationController?.pushViewController(memberPageViewController, animated: true)
    }
    
    @IBAction func onClick_SJH_btn(_ sender: Any) {
        let memberPageViewController = MemberPageViewController()
        memberPageViewController.name = "송정훈"
        self.navigationController?.pushViewController(memberPageViewController, animated: true)
    }
    
    @IBAction func onClick_TeamIntroduce_btn(_ sender: Any) {
        let teamIntroduceController = self.storyboard?.instantiateViewController(identifier: "TeamIntroduceController")
        
        teamIntroduceController?.modalTransitionStyle = .coverVertical
        teamIntroduceController?.modalPresentationStyle = .automatic
        
        self.present(teamIntroduceController!, animated: true, completion: nil)
    }
}
