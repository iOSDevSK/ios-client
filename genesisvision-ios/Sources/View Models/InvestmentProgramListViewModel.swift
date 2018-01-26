//
//  InvestmentProgramListViewModel.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 25.01.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

enum DataType {
    case api
    case fake
}

class InvestmentProgramListViewModel {
    
    var router: InvestmentProgramListRouter!
    
    // MARK: - Init
    init(withRouter router: InvestmentProgramListRouter) {
        self.router = router
    }
    
    // MARK: - Variables
    var dataType: DataType = .api
    
    var skip = 0            //offset
    var take = 10           //count of programs
    
    var totalCount = 0      //total count of programs
    
    var investmentProgramViewModels = [TraderTableViewCellViewModel]()
    
    // MARK: - Public methods
    func fetch(completion:@escaping () -> Void?) {
        switch dataType {
        case .api:
            let filter = InvestmentsFilter(managerId: nil, brokerId: nil, brokerTradeServerId: nil, investMaxAmountFrom: nil, investMaxAmountTo: nil, sorting: .byRatingAsc, skip: skip, take: take)
            apiInvestmentPrograms(withFilter: filter, completion: { [weak self] (investmentProgramsViewModel) in
                guard let investmentPrograms = investmentProgramsViewModel else { return  }
                
                var investmentProgramViewModels = [TraderTableViewCellViewModel]()
                
                self?.totalCount = investmentPrograms.total ?? 0
                
                investmentPrograms.investments?.forEach({ (investmentProgram) in
                    let entity = InvestmentProgramEntity()
                    entity.traslation(fromInvestmentProgram: investmentProgram)
                    let traderTableViewCellModel = TraderTableViewCellViewModel(investmentProgramEntity: entity)
                    investmentProgramViewModels.append(traderTableViewCellModel)
                })
                
                self?.investmentProgramViewModels = investmentProgramViewModels
                completion()
            })
        case .fake:
            fakeInvestmentPrograms { [weak self] (investmentProgramViewModels) in
                self?.investmentProgramViewModels = investmentProgramViewModels
                completion()
            }
        }
    }
    
    func fetchMore(completion:@escaping () -> Void?) {
        if skip >= totalCount {
            completion()
        }
        
        skip += take
        fetch(completion: completion)
    }
    
    func refresh(completion:@escaping () ->Void) {
        skip = 0
        fetch(completion: completion)
    }
    
    func programsCount() -> Int {
        return investmentProgramViewModels.count
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        return programsCount()
    }
    
    func getProgram(atIndex index: Int) -> TraderTableViewCellViewModel {
        return investmentProgramViewModels[index]
    }
    
    // MARK: - Navigation
    func showSignInVC() {
        router.show(routeType: .signIn)
    }
    
    func showProgramDetail(with traderEntity: InvestmentProgramEntity) {
        router.show(routeType: .showProgramDetail(traderEntity: traderEntity))
    }
    
    // MARK: - Private methods
    
    private func apiInvestmentPrograms(withFilter filter: InvestmentsFilter, completion: @escaping (_ investmentProgramsViewModel: InvestmentProgramsViewModel?) -> Void) {
        InvestorAPI.apiInvestorInvestmentsPostWithRequestBuilder(filter: filter).execute { (response, error) in
            guard response != nil && response?.statusCode == 200 else {
                return ErrorHandler.handleApiError(error: error, completion: { (result) in print(result) })
            }

            guard let investmentProgramsViewModel = response?.body else {
                return completion(nil)
            }
            
            completion(investmentProgramsViewModel)
        }
    }
    
    private func fakeInvestmentPrograms(completion: (_ traderCellModels: [TraderTableViewCellViewModel]) -> Void) {
        var cellModels = [TraderTableViewCellViewModel]()
        
        for _ in 0..<Constants.TemplatesCounts.traders {
            cellModels.append(TraderTableViewCellViewModel(investmentProgramEntity: InvestmentProgramEntity.templateEntity))
        }
        
        completion(cellModels)
    }
}