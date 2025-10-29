using { com.contractor.timesheet as ct } from '../db/contractor-model';


service WorkerAssign @(path : 'WorkerTastAssign_Service') {

    entity Project as projection on ct.Project;

    entity Position as projection on ct.Positions_roles;

    entity Tasks @(
        odata.draft.enabled : true
    )as projection on ct.Task;

    entity Worker as projection on ct.Worker{
        contractorProfile.contractor.co_name as co_names,
        *,
    };

    entity Contractor as projection on ct.Contractors;

    entity TaskAssignment as projection on ct.WorkerTaskAssignment{
        worker.contractorProfile.contractor.co_name as co_name,
        *,
    };

    entity SelectedWorkers as projection on ct.ContractorProfile{
        *,
    } where status = 'Selected';

}