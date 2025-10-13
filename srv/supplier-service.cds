using { com.contractor.timesheet as ct } from '../db/contractor-model';


service SupplierService @(path: 'Supplier_Service') {

    // Expose contractor requests
    entity ContractorRequests as projection on ct.ContractorRequest;

    // Expose contractor profiles
    entity ContractorProfiles as projection on ct.ContractorProfile;

    // Expose workers linked to suppliers
    entity Workers as projection on ct.Worker;

    // Expose timesheet entries so suppliers can view status
    entity TimesheetEntries as projection on ct.TimesheetEntry {
        ID,
        worker,          // association to Worker
        project,         // association to Project
        date,
        hoursWorked,
        status,          // this is the key field suppliers need
        percentComplete,
        costTaken
    };
}