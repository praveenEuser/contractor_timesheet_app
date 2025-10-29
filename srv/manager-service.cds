using { com.contractor.timesheet as ct } from '../db/contractor-model';
using { sap.common as cc } from '@sap/cds/common';


service ManagerService @(path : 'Manager_Service') {
    entity Buyers @(
        odata.draft.enabled : true
    )as projection on ct.Buyer;
    entity Projects @(
        odata.draft.enabled : true
    )as projection on ct.Project{
        *,
        positions
    };
    entity ContractorRequests as projection on ct.ContractorRequest;
    entity ContractorProfiles as projection on ct.ContractorProfile;

    entity ProjectManagers as projection on ct.ProjectManager;
    // Supplier actions
    action acceptRequest(requestID: UUID) returns String;
    action ignoreRequest(requestID: UUID, reason: String) returns String;

    // Manager actions
    action approveContractorProfile(profileID: UUID) returns String;
    action rejectContractorProfile(profileID: UUID) returns String;

    //entity TimesheetEntries as projection on ct.TimesheetEntry;
    
    entity Positions as projection on ct.Positions_roles{
        *,
        tasks
    };

    entity Contractor as projection on ct.Contractors;

    entity Currencies as projection on cc.Currencies;
    entity Suppliers @(
        odata.draft.enabled : true
    ) as projection on ct.Supplier;
    
    entity Workers as projection on ct.Worker;

    entity Tasks as projection on ct.Task{
        *,
        assignments
    };

    entity WorkerTaskAssignment as projection on ct.WorkerTaskAssignment;

}