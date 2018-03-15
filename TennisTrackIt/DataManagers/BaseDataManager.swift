//
//  BaseDataManager.swift
//  TennisTrackIt
//
//  Created by Annie Persson on 02/03/2018.
//  Copyright © 2018 Annie Persson. All rights reserved.
//

import Foundation
import SwiftyJSON

class BaseDataManager {
  
  // MARK: - Internal properties
  
  typealias Success = Bool
  
  /// Name of the file the data is stored in. Should be a .json file name
  internal var fileName: String = "data.json"
  
  /// Name of the folder the data is stored in - Default value is "data"
  internal let folderName: String = "data"
  
  /// Returns the path using the folderName and fileName properties
  internal var filePath: String {
    return "\(folderName)/\(fileName)"
  }
  
  // MARK: - Private properties
  
  private var documentsDirectory: URL? {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
  }
  
  // MARK: - Internal methods
  
  internal func readFile(atPath path: String) -> JSON? {
    
    guard let directory = documentsDirectory else {
      Logger.warn("Failed to read documents directory")
      return nil
    }
    
    let filePath = directory.appendingPathComponent(path)
    
    do {
      let fileContent = try String(contentsOf: filePath, encoding: String.Encoding.utf8)
      
      return JSON(parseJSON: fileContent)
      
    } catch let error as NSError {
      
      Logger.error("Failed to read content at path: \(filePath.absoluteString), with error: \(error.debugDescription)")
    }
    
    return nil
    
  }
  
  internal func saveToFile(named name: String, inFolder folderName: String, withContent content: String) {
    
    guard let directoryPath = createDirectory(named: folderName) else {
      Logger.warn("Failed to create directory with folder name \(folderName)")
      return
    }
    
    let fileComponents = name.components(separatedBy: ".")
    let filePath = directoryPath.appendingPathComponent(fileComponents[0]).appendingPathExtension(fileComponents[1])
    
    // Save file content
    do {
      
      let _ = try content.write(to: filePath, atomically: true, encoding: String.Encoding.utf8)
      return
      
    } catch let error as NSError {
      Logger.error("Failed to write to file at path: \(filePath.absoluteString), with error: \(error.description)")
    }
    
    return
    
  }
  
  // MARK: - Private methods
  
  private func createDirectory(named folderName: String) -> URL? {
    
    guard let directory = documentsDirectory else { return nil }
    
    let directoryPath = directory.appendingPathComponent(folderName)
    
    // Create the directory
    do {
      
      try FileManager.default.createDirectory(at: directoryPath, withIntermediateDirectories: true, attributes: nil)
      
    } catch let error as NSError {
      
      Logger.error("Failed to create folder at path: \(directoryPath.absoluteString), with error: \(error.debugDescription)")
    }
    
    return directoryPath
  }
  
}
