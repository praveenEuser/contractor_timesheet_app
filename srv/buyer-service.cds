using { com.contractor.timesheet as ct } from '../db/contractor-model';
using { sap.common as cc } from '@sap/cds/common';


service Buyer @(path: 'Buyer_Service',requires: 'authenticated-user') {

    entity ContractorRequestEntity @(restrict: [
      { grant: '*', to: ['BuyerRole'], where: 'requestedBy_ID = $user.BuyerID' }
    ])as projection on ct.ContractorRequest{
        @readonly position.buyer.buyer_name,
        *,
        position : Association to Positions on position.ID = position_ID,
        requestsupplier
    }; 
    entity ProjectsEntity @(restrict: [
      { grant: '*', to: ['BuyerRole'] }
    ])as projection on ct.Project;

    entity Suppliers @(restrict: [
      { grant: '*', to: ['BuyerRole'] }
    ])as projection on ct.Supplier{
        @readonly supplier_name,
        *,
    };

    entity Buyers @(restrict: [
      { grant: '*', to: ['BuyerRole'] }
    ])as projection on ct.Buyer{
        @readonly buyer_name,
        *,
    };

    entity Positions @(
        odata.draft.enabled: true,
        restrict: [
            { grant: '*', to: ['BuyerRole'], where: 'buyer_ID = $user.BuyerID' }
        ]
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


    


    entity RequestSuppliers @(restrict: [
      { grant: '*', to: ['BuyerRole']}
    ]) as projection on ct.RequestSuppliers{
        @readonly status,
        *,
    };


    entity ContractorProfile @(restrict: [
      { grant: '*', to: ['BuyerRole'] }
    ]) as projection on ct.ContractorProfile{
        @readonly contractor_ID,
        *,
    };

    @readonly
    entity Contractor @(restrict: [
      { grant: 'READ', to: ['BuyerRole'] }
    ]) as projection on ct.Contractors;

    entity Currencies @(restrict: [
      { grant: 'READ', to: ['BuyerRole'] }
    ]) as projection on cc.Currencies;

    
    // entity Worker @(
    //     odata.draft.enabled: true
    // )as projection on ct.Worker{
    //     ID,
    //     supplier_ID,
    //     assignedProject_ID,
    //     contractorProfile_ID,
    //     assignedPosition_ID,
        

    //     assignedPosition.ID           as position_ID,
    //     assignedPosition.project_ID   as project_ID,
    //     assignedPosition.buyer_ID     as buyer_ID,
    //     assignedPosition.project_manager_ID as project_manager_ID,

    //     *,
    // };
    

}