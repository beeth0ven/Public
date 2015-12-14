//
//  SectionsAsDataSource.swift
//  Test
//
//  Created by luojie on 15/12/11.
//  Copyright © 2015年 LuoJie. All rights reserved.
//

import Foundation

protocol SectionsAsDataSource {
    typealias S: SectionInfoEnum
    typealias C: CellInfoEnum
    var sections: [Section<S, C>] { get set }
}

extension SectionsAsDataSource {
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfCellInfosInSection(section: Int) -> Int {
        return sections[section].cellInfos.count
    }
    
    func cellInfoAtIndexPath(indexPath: NSIndexPath) -> C {
        return sections[indexPath.section].cellInfos[indexPath.item]
    }
}

protocol SectionInfoEnum { }
protocol CellInfoEnum {
    var cellReuseIdentifer: String { get }
}

struct Section<SectionInfo, CellInfo where SectionInfo: SectionInfoEnum, CellInfo: CellInfoEnum > {
    var sectionInfo:    SectionInfo
    var cellInfos:      [CellInfo]
}
