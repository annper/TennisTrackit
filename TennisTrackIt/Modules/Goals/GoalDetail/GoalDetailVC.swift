//
//  GoalDetailVC.swift
//  TennisTrackIt
//
//  Created by Annie Persson on 02/03/2018.
//  Copyright © 2018 Annie Persson. All rights reserved.
//

import UIKit

class GoalDetailVC: UIViewController {
  
  private var goal: Goal!
  
  @IBOutlet var descTextView: UITextView! { didSet {
    descTextView.layer.cornerRadius = 5
  }}
  
  @IBOutlet var createdLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    navigationController?.navigationItem.title = goal.title
   
    Logger.info("GoalDetailVC")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
    Logger.warn("didReceiveMemoryWarning")
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
