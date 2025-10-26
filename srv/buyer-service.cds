using { com.contractor.timesheet as ct } from '../db/contractor-model';
using { sap.common as cc } from '@sap/cds/common';


service Buyer @(path: 'Buyer_Service') {

    entity ContractorRequestEntity as projection on ct.ContractorRequest{
        @readonly position.buyer.buyer_name,
        *,
        position : Association to Positions on position.ID = position_ID,
        requestsupplier
    }; 
    entity ProjectsEntity as projection on ct.Project;

    entity Suppliers as projection on ct.Supplier{
        @readonly supplier_name,
        *,
    };

    entity Buyers as projection on ct.Buyer{
        @readonly buyer_name,
        *,
    };

    entity Positions @(
        odata.draft.enabled: true
    )as projection on ct.Positions_roles{
        @readonly ID,
        @readonly roles,
        @readonly no_of_positions,
        @readonly description,
        @readonly hourlyRate,
        @readonly currency_code,
        @readonly status,
        project,
        buyer,
        project.project_manager.Manager_name,
        *,
        
        contractor_req
    };

    


    entity RequestSuppliers  as projection on ct.RequestSuppliers{
        @readonly status,
        *,
    };


    entity ContractorProfile as projection on ct.ContractorProfile{
        @readonly contractor_ID,
        *,
    };

    @readonly
    entity Contractor as projection on ct.Contractors;

    entity Currencies as projection on cc.Currencies;

    

    

}