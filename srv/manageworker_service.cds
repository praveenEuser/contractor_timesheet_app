using { com.contractor.timesheet as ct } from '../db/contractor-model';
using { sap.common as cc } from '@sap/cds/common';


service ManageWorkerService @(path : 'ManageWorker_Service',requires: 'authenticated-user') {
    entity Buyers @(restrict: [
      { grant: '*', to: ['ProjectManagerRole'] }
    ]) as projection on ct.Buyer;
    entity Projects @(restrict: [
      { grant: '*', to: ['ProjectManagerRole'], where: 'project_manager_ID = $user.ManagerID' }
    ]) as projection on ct.Project{
        *,
        positions
    };
    entity ContractorRequests  @(restrict: [
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
    ]) as projection on ct.Contractors{
        @readonly co_name,
        *,
    };

    entity Currencies @(restrict: [
      { grant: 'READ', to: ['ProjectManagerRole'] }
    ]) as projection on cc.Currencies;
    entity Suppliers @(restrict: [
      { grant: '*', to: ['ProjectManagerRole'] }
    ]) as projection on ct.Supplier;
    
    entity Workers @(
        odata.draft.enabled : true,
        restrict: [
            { grant: '*', to: ['ProjectManagerRole'], where : 'assigned_ProjectManager_ID = $user.ManagerID' }
        ]
    )as projection on ct.Worker{
        @readonly ID,
        *,
    };

    entity Tasks @(restrict: [
      { grant: '*', to: ['ProjectManagerRole'] }
    ]) as projection on ct.Task{
        @readonly isBillable,
        *,
        assignments
    };

    entity Timesheet @(restrict: [
      { grant: '*', to: ['ProjectManagerRole'] }
    ]) as projection on ct.WorkerTimeSheet{
        @readonly worker_ID,
        @readonly weekStart,
        @readonly weekEnd,
        @readonly totalhours,
        //@readonly comments,
        @readonly comments,
        *
    };
    entity TimeEntry @(restrict: [
      { grant: '*', to: ['ProjectManagerRole'] }
    ]) as projection on ct.TimeEntry{
      @readonly workDate,
      @readonly tasks_ID,
      @readonly timesheet_ID,
      @readonly hours,
      @readonly notes,
      @readonly tasks.task.isBillable,
      *
    };

    entity WorkerTaskAssignment @(restrict: [
      { grant: '*', to: ['ProjectManagerRole'] }
    ]) as projection on ct.WorkerTaskAssignment;

}