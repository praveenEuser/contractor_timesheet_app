using { com.contractor.timesheet as ct } from '../db/contractor-model';
using { sap.common as cc } from '@sap/cds/common';


service ManageWorkerService @(path : 'ManageWorker_Service') {
    entity Buyers as projection on ct.Buyer;
    entity Projects as projection on ct.Project{
        *,
        positions
    };
    entity ContractorRequests as projection on ct.ContractorRequest;
    entity SelectedWorkers as projection on ct.ContractorProfile{
        *,
    } where status = 'Selected';

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

    entity Contractor as projection on ct.Contractors{
        @readonly co_name,
        *,
    };

    entity Currencies as projection on cc.Currencies;
    entity Suppliers as projection on ct.Supplier;
    
    entity Workers @(
        odata.draft.enabled : true
    )as projection on ct.Worker{
        @readonly ID,
        *,
    };

    entity Tasks as projection on ct.Task{
        *,
        assignments
    };

    entity Timesheet as projection on ct.WorkerTimeSheet{
        @readonly worker_ID,
        @readonly weekStart,
        @readonly weekEnd,
        //@readonly comments,
        @readonly comments,

        *,
    };
    entity TimeEntry as projection on ct.TimeEntry;

    entity WorkerTaskAssignment as projection on ct.WorkerTaskAssignment;

}