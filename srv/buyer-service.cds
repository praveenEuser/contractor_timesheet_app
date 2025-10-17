using { com.contractor.timesheet as ct } from '../db/contractor-model';


service Buyer @(path: 'Buyer_Service') {

    entity ContractorRequestEntity @(
        odata.draft.enabled: true
    ) as projection on ct.ContractorRequest;
    entity ProjectsEntity @(
        odata.draft.enabled: true
    ) as projection on ct.Project;

    entity Positions as projection on ct.Positions_roles;
}