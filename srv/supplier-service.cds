using { com.contractor.timesheet as ct } from '../db/contractor-model';


service SupplierService @(path: 'Supplier_Service') {

    // Expose contractor requests
    @readonly
    entity ContractorRequests as projection on ct.ContractorRequest{
        *,
        position : Association to Positions on position.ID = position_ID,
        requestsupplier
    };

    @readonly
    entity ProjectManagers as projection on ct.ProjectManager;
    @readonly
    entity Projects as projection on ct.Project;
    @readonly
    entity Positions as projection on ct.Positions_roles;

    entity RequestSuppliers @(
        odata.draft.enabled : true
    )as projection on ct.RequestSuppliers{
        *,
        responses
    };

    // Expose contractor profiles
    entity ContractorProfiles as projection on ct.ContractorProfile;

    @readonly
    entity Buyers as projection on ct.Buyer;

    // Expose workers linked to suppliers
    entity Workers as projection on ct.Worker;

    entity Contractor @(
        odata.draft.enabled : true
    )as projection on ct.Contractors;

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