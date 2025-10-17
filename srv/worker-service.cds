using { com.contractor.timesheet as ct } from '../db/contractor-model';

service WorkerService @(path: 'Worker_Service') {

    // Expose workers themselves
    entity Workers as projection on ct.Worker;

    // Expose timesheet entries for workers
    entity TimesheetEntries as projection on ct.TimesheetEntry {
        ID,
        worker,          // association to Worker
        project,         // association to Project
        date,
        hoursWorked,
        status,
        percentComplete,
        costTaken
    };

    // Expose projects for reference
    entity Projects as projection on ct.Project {
        ID,
        project_name,
        startDate,
        endDate,
        plannedHours,
        positions.hourlyRate
    };
}