using { com.contractor.timesheet as ct } from '../db/contractor-model';

service ManagerService @(path : 'Manager_Service') {
    entity Buyers as projection on ct.Buyer;
    entity Projects as projection on ct.Project;
    entity ContractorRequests as projection on ct.ContractorRequest;
    entity ContractorProfiles as projection on ct.ContractorProfile;
    entity TimesheetEntries as projection on ct.TimesheetEntry;
    entity Suppliers as projection on ct.Supplier;
    entity Workers as projection on ct.Worker;

}