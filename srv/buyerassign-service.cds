using { com.contractor.timesheet as ct } from '../db/contractor-model';
using { sap.common as cc } from '@sap/cds/common';

service BuyerAssignService @(path: 'BuyerAssign_Service'){

    entity Buyers @(
        odata.draft.enabled : true
    )as projection on ct.Buyer{
        @readonly buyer_name,
        *,
    };

    entity Projects @(
        odata.draft.enabled : true
    ) as projection on ct.Project{
        @readonly project_name,
        @readonly plannedHours,
        @readonly startDate,
        @readonly endDate,
        @readonly project_manager_ID,
        *,
        positions
    };
    entity ContractorRequests as projection on ct.ContractorRequest;
    entity SelectedWorkers as projection on ct.ContractorProfile{
        contractor.co_name as co_name,
        *,
    } where status = 'Selected';

    entity ProjectManagers as projection on ct.ProjectManager{
        @readonly Manager_name,
        *,
    };
    // Supplier actions
    action acceptRequest(requestID: UUID) returns String;
    action ignoreRequest(requestID: UUID, reason: String) returns String;

    // Manager actions
    action approveContractorProfile(profileID: UUID) returns String;
    action rejectContractorProfile(profileID: UUID) returns String;

    //entity TimesheetEntries as projection on ct.TimesheetEntry;
    
    entity Positions as projection on ct.Positions_roles{
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

    entity Currencies as projection on cc.Currencies;
    entity Suppliers as projection on ct.Supplier;
    
    entity Workers as projection on ct.Worker;

    entity Contractor as projection on ct.Contractors{
        @readonly co_name,
        @readonly experience,
        @readonly skills,
        @readonly supplier_ID,
        *,
    };
    

}