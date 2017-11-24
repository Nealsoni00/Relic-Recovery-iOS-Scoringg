//
//  infoVC.swift
//  RES-Q
//
//  Created by Neal Soni on 11/20/17.
//
import UIKit
import MessageUI

class InfoViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let darkGrey = UIColor(red:0.27, green:0.33, blue:0.36, alpha:1.0)
        self.navigationController?.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = darkGrey
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir Light", size: 22)!, NSForegroundColorAttributeName: UIColor.white]
        UIApplication.shared.statusBarStyle = .lightContent
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        
        self.navigationItem.backBarButtonItem = backButton
        //self.navigationController?.isNavigationBarHidden = true

        self.navigationItem.title = "About"
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                if let url = URL(string: "https://sparkrobotics.org/") {
                    UIApplication.shared.open(url, options: [:])
                }
                tableView.deselectRow(at: indexPath, animated: true)
            case 1:
                sendMail("sparkrobotics@gmail.com")
                tableView.deselectRow(at: indexPath, animated: true)
            case 2:
                sendMail("nealsoni00@gmail.com")
                tableView.deselectRow(at: indexPath, animated: true)
                
            case 3:
                sendMail("nealson00@gmail.com")
                tableView.deselectRow(at: indexPath, animated: true)
            case 4:
                sendMail("nealsoni00@gmail.com")
                tableView.deselectRow(at: indexPath, animated: true)
            default:
                break
            }
        }
        
    }
    
    
    
    func sendMail(_ address: String) {
        let toRecipents = [address]
        let mc = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setToRecipients(toRecipents)
        mc.setSubject("Know Snow")
        
        //TODO: CHECK IF MAIL VC IS PRESENTED ON iPHONE!
        self.present(mc, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller:MFMailComposeViewController, didFinishWith result:MFMailComposeResult, error:Error?) {
        switch result {
        case MFMailComposeResult.cancelled:
            print("Mail cancelled")
        case .saved:
            print("Mail saved")
        case .sent:
            print("Mail sent")
        case .failed:
            print("Mail sent failure: \(String(describing: error?.localizedDescription))")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
}
