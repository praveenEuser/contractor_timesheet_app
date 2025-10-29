using { com.contractor.timesheet as ct } from '../db/contractor-model';


service WorkerService @(path: 'Timesheet_Service') {

    // Expose workers themselves
    @readonly
    entity Workers as projection on ct.Worker;

    // Expose timesheet entries for workers
    entity TimeSheetEntity @(
        odata.draft.enabled : true
    )as projection on ct.WorkerTimeSheet{
        @readyonly worker_ID,
        //@readonly totalhours,
        *,
    };

    // Expose projects for reference
    entity ProjectsEntity as projection on ct.Project;

    entity PositionsEntity as projection on ct.Positions_roles;

    entity TimeEntryEntity as projection on ct.TimeEntry;

    entity TasksEntity as projection on ct.Task;
}