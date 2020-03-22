//
//  ComicsDetailsViewModel.swift
//  MarvelFlutter
//
//  Created by Pedro Felipe Coloma de Araujo on 21/03/20.
//  Copyright © 2020 Pedro Felipe Coloma de Araujo. All rights reserved.
//

import Foundation

protocol ComicsDetailsViewModelViewDelegate: AnyObject {
    func didLoadImageWithSuccess(image: Data)
}

class ComicsDetailsViewModel {
    
    var comic: Comic?
    var viewDelegate: ComicsDetailsViewModelViewDelegate?
    
    init(_ comic: Comic) {
        getImage()
        self.comic = comic
        
        getImage()
    }
    
    func getImage() {
        let api = API()
        
        guard let thumbnail = comic?.thumbnail else { return }
        api.download(endpoint: .comicDetailsImage(thumbnail)) { (data, response, error) in
            if let data = data {
                self.viewDelegate?.didLoadImageWithSuccess(image: data)
            }
        }
    }
}