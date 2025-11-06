using { com.contractor.timesheet as ct } from '../db/contractor-model';
using { sap.common as cc } from '@sap/cds/common';

service BuyerAssignService @(path: 'BuyerAssign_Service', requires: 'authenticated-user'){

    entity Buyers @(
        odata.draft.enabled : true,
        restrict: [
            { grant: '*', to: ['BuyerRole'] }
        ]
    )as projection on ct.Buyer{
        @readonly buyer_name,
        *,
    };

    entity Projects @(
        odata.draft.enabled : true,
        restrict: [
            { grant: '*', to: ['BuyerRole'] }
        ]
    ) as projection on ct.Project{
        @readonly project_name,
        @readonly plannedHours,
        @readonly startDate,
        @readonly endDate,
        @readonly project_manager_ID,
        *,
        positions
    };
    entity ContractorRequests @(restrict: [
      { grant: '*', to: ['BuyerRole'] }
    ]) as projection on ct.ContractorRequest;
    entity SelectedWorkers @(restrict: [
      { grant: 'READ', to: ['BuyerRole'] }
    ]) as projection on ct.ContractorProfile{
        contractor.co_name as co_name,
        *,
    } where status = 'Selected';

    entity ProjectManagers @(restrict: [
      { grant: 'READ', to: ['BuyerRole'] }
    ]) as projection on ct.ProjectManager{
        @readonly Manager_name,
        *,
    };


    //entity TimesheetEntries as projection on ct.TimesheetEntry;
    
    entity Positions @(restrict: [
      { grant: '*', to: ['BuyerRole'] }
    ]) as projection on ct.Positions_roles{
        @readonly ID,
        @readonly roles,
        @readonly no_of_positions,
        @readonly hourlyRate,
        @readonly currency_code,
        @readonly status,
        @readonly description,
        @readonly project_ID,
        @readonly buyer_ID,
        @readonly project_manager_ID,
        @readonly supplier_ID,
        *,
        workers,
    };

    entity Currencies @(restrict: [
      { grant: 'READ', to: ['BuyerRole'] }
    ]) as projection on cc.Currencies;
    entity Suppliers @(restrict: [
      { grant: '*', to: ['BuyerRole'] }
    ]) as projection on ct.Supplier;
    
    entity Workers @(restrict: [
      { grant: '*', to: ['BuyerRole'] }
    ]) as projection on ct.Worker;

    entity Contractor @(restrict: [
      { grant: 'READ', to: ['BuyerRole'] }
    ]) as projection on ct.Contractors{
        @readonly co_name,
        @readonly experience,
        @readonly skills,
        @readonly supplier_ID,
        *,
    };
    

}