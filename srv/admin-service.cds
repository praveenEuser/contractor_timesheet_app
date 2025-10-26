using { com.contractor.timesheet as ct } from '../db/contractor-model';


service Admin @(path : 'Admin_Service') {

    entity ManagerEntity @(
        odata.draft.enabled : true
    ) as projection on ct.ProjectManager;
    entity BuyerEntity @(
        odata.draft.enabled : true
    ) as projection on ct.Buyer;
    entity SupplierEntity @(
        odata.draft.enabled : true
    ) as projection on ct.Supplier;
    entity WorkerEntity @(
        odata.draft.enabled : true
    ) as projection on ct.Worker;

    entity Contractor as projection on ct.Contractors;

    entity SelectedWorkers as projection on ct.ContractorProfile{
        *,
    } where status = 'Selected';

}