//
//  SkyLog.swift
//  swc-manager
//
//  Created by JayKim on 2022/08/11.
//

import Foundation

public class SkyLog: NSObject {
    
    public static func d(tag : String, logLevel lv: Logger.Level,message: String) {
        let loggerMessage = Logger.Message(stringLiteral: message)
        
        var logger = Logger(label: tag)
        logger.logLevel = lv
        logger.debug(loggerMessage)
    }
    
    public static func i(tag : String, logLevel lv: Logger.Level,message: String) {
        let loggerMessage = Logger.Message(stringLiteral: message)
        var logger = Logger(label: tag)
        logger.logLevel = lv
        logger.info(loggerMessage)
    }
    
    public static func e(tag : String, logLevel lv: Logger.Level,message: String) {
        let loggerMessage = Logger.Message(stringLiteral: message)
        var logger = Logger(label: tag)
        logger.logLevel = lv
        logger.error(loggerMessage)
    }
    
    public static func t(tag : String, logLevel lv: Logger.Level,message: String) {
        let loggerMessage = Logger.Message(stringLiteral: message)
        var logger = Logger(label: tag)
        logger.logLevel = lv
        logger.trace(loggerMessage)
    }
    
    public static func n(tag : String, logLevel lv: Logger.Level,message: String) {
        let loggerMessage = Logger.Message(stringLiteral: message)
        var logger = Logger(label: tag)
        logger.logLevel = lv
        logger.notice(loggerMessage)
    }
    
    public static func w(tag : String, logLevel lv: Logger.Level,message: String) {
        let loggerMessage = Logger.Message(stringLiteral: message)
        var logger = Logger(label: tag)
        logger.logLevel = lv
        logger.warning(loggerMessage)
    }
    
    public static func c(tag : String, logLevel lv: Logger.Level,message: String) {
        let loggerMessage = Logger.Message(stringLiteral: message)
        var logger = Logger(label: tag)
        logger.logLevel = lv
        logger.critical(loggerMessage)
    }
    
}
