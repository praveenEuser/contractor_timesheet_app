using { com.contractor.timesheet as ct } from '../db/contractor-model';

service ManagerService @(path : 'Manager_Service') {
    entity Buyers @(
        odata.draft.enabled : true
    )as projection on ct.Buyer;
    entity Projects @(
        odata.draft.enabled : true
    ) as projection on ct.Project;
    entity ContractorRequests @(
        odata.draft.enabled : true
    ) as projection on ct.ContractorRequest;
    entity ContractorProfiles @(
        odata.draft.enabled : true
    ) as projection on ct.ContractorProfile;

    // Supplier actions
    action acceptRequest(requestID: UUID) returns String;
    action ignoreRequest(requestID: UUID, reason: String) returns String;

    // Manager actions
    action approveContractorProfile(profileID: UUID) returns String;
    action rejectContractorProfile(profileID: UUID) returns String;

    entity TimesheetEntries as projection on ct.TimesheetEntry;
    
    entity Suppliers @(
        odata.draft.enabled : true
    ) as projection on ct.Supplier;
    entity Workers @(
        odata.draft.enabled : true
    ) as projection on ct.Worker;

}