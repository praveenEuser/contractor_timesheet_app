using { com.contractor.timesheet as ct } from '../db/contractor-model';
using { sap.common as cc } from '@sap/cds/common';


service ManagerService @(path : 'Manager_Service', requires: 'authenticated-user') {
    entity Buyers @(
        odata.draft.enabled : true,
        restrict: [
            { grant: '*', to: ['ProjectManagerRole'] }
        ]
    )as projection on ct.Buyer;
    entity Projects @(
        odata.draft.enabled : true,
        restrict: [
            { grant: '*', to: ['ProjectManagerRole'], where: 'project_manager_ID = $user.ManagerID' }
        ]
    )as projection on ct.Project{
        *,
        positions
    };
    entity ContractorRequests @(restrict: [
      { grant: '*', to: ['ProjectManagerRole'] }
    ]) as projection on ct.ContractorRequest;
    entity SelectedWorkers @(restrict: [
      { grant: 'READ', to: ['ProjectManagerRole'] }
    ]) as projection on ct.ContractorProfile{
        *,
    } where status = 'Selected';

    entity ProjectManagers @(restrict: [
      { grant: '*', to: ['ProjectManagerRole'] }
    ]) as projection on ct.ProjectManager;


    //entity TimesheetEntries as projection on ct.TimesheetEntry;
    
    entity Positions @(restrict: [
      { grant: '*', to: ['ProjectManagerRole'], where: 'project_manager_ID = $user.ManagerID' }
    ]) as projection on ct.Positions_roles{
        *,
        tasks
    };

    entity Contractor @(restrict: [
      { grant: 'READ', to: ['ProjectManagerRole'] }
    ]) as projection on ct.Contractors;

    entity Currencies @(restrict: [
      { grant: 'READ', to: ['ProjectManagerRole'] }
    ]) as projection on cc.Currencies;
    entity Suppliers @(
        odata.draft.enabled : true,
        restrict: [
            { grant: '*', to: ['ProjectManagerRole'] }
        ]
    ) as projection on ct.Supplier;
    
    entity Workers @(restrict: [
      { grant: '*', to: ['ProjectManagerRole'] }
    ]) as projection on ct.Worker;

    entity Tasks @(restrict: [
      { grant: '*', to: ['ProjectManagerRole'] }
    ]) as projection on ct.Task{
        *,
        assignments
    };

    entity Timesheet @(restrict: [
      { grant: '*', to: ['ProjectManagerRole'] }
    ]) as projection on ct.WorkerTimeSheet;
    entity TimeEntry @(restrict: [
      { grant: '*', to: ['ProjectManagerRole'] }
    ]) as projection on ct.TimeEntry;

    entity WorkerTaskAssignment @(restrict: [
      { grant: '*', to: ['ProjectManagerRole'] }
    ]) as projection on ct.WorkerTaskAssignment;

}