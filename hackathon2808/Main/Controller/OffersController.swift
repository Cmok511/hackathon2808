//
//  OffersController.swift
//  hackathon2808
//
//

import Foundation
import UIKit
import SDWebImage
import PromiseKit
import Toast

final class OffersController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private let model = MainModel()
   
    private var facultyArray: [GettingFaculty] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getAllFaculty()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationController()
    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func getAllFaculty() {
        startSpinnerBlure()
        firstly {
            model.getAllFaculty()
        }.done { data in
            if data.message?.lowercased() == "ok" {
                self.stopSpinnerBlure()
                self.facultyArray = data.data ?? []
            } else {
                self.stopSpinnerBlure()
                self.view.makeToast(data.description)
            }
        }.catch { error in
            self.stopSpinnerBlure()
            print(error.localizedDescription)
            self.view.makeToast("Что-то пошло не так")
        }
    }
    
    
    
    private func setNavigationController() {
        // navbarView avatarView
        let imageSize: CGFloat = 34
        let userProfileView = UIView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
        userProfileView.layer.cornerRadius = imageSize / 2
        userProfileView.clipsToBounds = true
        
        let userProfileButton = UIButton()
        userProfileButton.frame.size = CGSize(width: imageSize, height: imageSize)
        userProfileButton.addTarget(self, action: #selector(pushProfileController), for: .touchUpInside)
        userProfileView.addSubview(userProfileButton)
        //load avarar
        let url = URL(string: UserManager.shared.avatar ?? "")
        
        SDWebImageManager.shared.loadImage(with: url, progress: nil) { image, _, _, _, _, _ in
            if let image {
                userProfileButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
            } else {
                userProfileButton.setImage(UIImage(named: "emptyAvatar"), for: .normal)

            }
            self.navigationItem.setLeftBarButton(UIBarButtonItem(customView: userProfileView), animated: true)
        }
    }
    
    @objc private func pushProfileController() {
        guard let viewController = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else {
            return
        }
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction private func notificationsBattonTapped() {
        guard let viewController = UIStoryboard(name: "Offers", bundle: nil).instantiateViewController(withIdentifier: "NotificationsController") as? NotificationsController else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
//MARK: - UITableViewDataSource
extension OffersController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        facultyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UniversityCell.reuseID, for: indexPath) as! UniversityCell
        cell.configure(faculty: facultyArray[indexPath.row])
        return cell
    }
}

extension OffersController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = UIStoryboard(name: "Offers", bundle: nil).instantiateViewController(withIdentifier: "UnivercityController") as? UnivercityController else {
            return
        }
        viewController.hidesBottomBarWhenPushed = true
        viewController.facultyId = facultyArray[indexPath.row].id
        navigationController?.pushViewController(viewController, animated: true)
    }
}
