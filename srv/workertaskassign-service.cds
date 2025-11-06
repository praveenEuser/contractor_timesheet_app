using { com.contractor.timesheet as ct } from '../db/contractor-model';


service WorkerAssign @(path : 'WorkerTastAssign_Service', requires: 'authenticated-user') {

    entity Project @(restrict: [
      { grant: 'READ', to: ['WorkerRole'] }
    ]) as projection on ct.Project;

    entity Position @(restrict: [
      { grant: 'READ', to: ['WorkerRole'], where: 'project_manager_ID = $user.ManagerID' }
    ]) as projection on ct.Positions_roles;

    entity Tasks @(
        odata.draft.enabled : true,
        restrict: [
            { grant: '*', to: ['WorkerRole'] }
        ]
    )as projection on ct.Task;

    entity Worker @(restrict: [
      { grant: '*', to: ['WorkerRole'], where : 'assigned_ProjectManager_ID = $user.ManagerID' }
    ]) as projection on ct.Worker{
        contractorProfile.contractor.co_name as co_names,
        *,
    };

    entity Contractor @(restrict: [
      { grant: 'READ', to: ['WorkerRole'] }
    ]) as projection on ct.Contractors;

    entity TaskAssignment @(restrict: [
      { grant: '*', to: ['WorkerRole'] }
    ]) as projection on ct.WorkerTaskAssignment{
        worker.contractorProfile.contractor.co_name as co_name,
        *,
    };

    entity SelectedWorkers @(restrict: [
      { grant: 'READ', to: ['WorkerRole'] }
    ]) as projection on ct.ContractorProfile{
        *,
    } where status = 'Selected';


}