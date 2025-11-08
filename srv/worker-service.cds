using { com.contractor.timesheet as ct } from '../db/contractor-model';


service WorkerService @(path: 'Timesheet_Service', requires: 'authenticated-user') {

    // Expose workers themselves
    @readonly
    entity Workers @(restrict: [
      { grant: 'READ', to: ['WorkerRole'], where: 'ID = $user.WorkerID' }
    ]) as projection on ct.Worker{
      contractorProfile.contractor.co_name as co_name,
      *,
    };

    entity ContractorProfile as projection on ct.ContractorProfile;

    entity Contractor as projection on ct.Contractors;

    // Expose timesheet entries for workers
    entity TimeSheetEntity @(
        odata.draft.enabled : true,
        restrict: [
            { grant: '*', to: ['WorkerRole'], where: 'worker_ID = $user.WorkerID' }
        ]
    )as projection on ct.WorkerTimeSheet{
        @readonly rejectedreason,
        worker_ID,
        //@readonly totalhours,
        *,
    };

    // Expose projects for reference
    entity ProjectsEntity @(restrict: [
      { grant: 'READ', to: ['WorkerRole'] }
    ]) as projection on ct.Project;

    entity PositionsEntity @(restrict: [
      { grant: 'READ', to: ['WorkerRole'] }
    ]) as projection on ct.Positions_roles;

    entity TimeEntryEntity @(restrict: [
      { grant: '*', to: ['WorkerRole'] }
    ]) as projection on ct.TimeEntry{
        tasks.task_ID as w_task,
        *,

    };

    entity TasksEntity @(restrict: [
      { grant: 'READ', to: ['WorkerRole'] }
    ]) as projection on ct.Task;

    entity WorkerTask @(restrict: [
      { grant: '*', to: ['WorkerRole'], where: 'worker_ID = $user.WorkerID' }
    ]) as projection on ct.WorkerTaskAssignment{
        
        task.description as t_description,
        task.isBillable as t_billable,
        *,
    };
}