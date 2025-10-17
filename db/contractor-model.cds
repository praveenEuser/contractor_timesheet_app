namespace com.contractor.timesheet;

using { cuid,managed } from '@sap/cds/common';
using { commons_cds.Email as email} from './common';
 
entity Buyer:cuid {
    buyer_name: String @title : '{i18n>buyer_name}';
    department: String @title : '{i18n>department}';
    b_contactEmail: email @title : '{i18n>b_contactEmail}';
}

entity Supplier:cuid {
    supplier_name: String @title : '{i18n>supplier_name}';
    s_contactEmail: email @title : '{i18n>s_contactEmail}';
}

entity ProjectManager:cuid {
    Manager_name: String @title : '{i18n>Manager_name}';
    p_contactEmail: email @title : '{i18n>p_contactEmail}';
}

entity Positions_roles:cuid {
    roles: String;
    no_of_positions: Integer;
    project_ID : UUID;
    project: Association to Project on project.ID = project_ID;
    buyer_ID     : UUID @title : '{i18n>BuyerID}';
    buyer        : Association to Buyer on buyer.ID = buyer_ID @title : '{i18n>Buyer}';
    hourlyRate: Decimal(10,2) @title : '{i18n>hourlyRate}';
    description: String @UI.multiLineText: true;
}

entity Project:cuid {
    project_name: String @default: 'Unknown' @title : '{i18n>project_name}';
    project_manager_ID : UUID @title : '{i18n>project_manager_ID}';
    worker_ID : UUID @title : '{i18n>WorkerID}';
    supplier_ID: UUID; 
    project_manager: Association to ProjectManager on project_manager.ID  = project_manager_ID @title : '{i18n>project_manager}';
    worker : Association to one Worker on worker.ID = worker_ID @title : '{i18n>Worker}';
    supplier: Association to one Supplier on supplier.ID = supplier_ID;
    startDate: Date @title : '{i18n>startDate}';
    endDate: Date @title : '{i18n>endDate}';
    positions: Composition of many Positions_roles on positions.project_ID = $self.ID;
    plannedHours: Integer @title : '{i18n>plannedHours}';
}

entity ContractorRequest : cuid {
    requestedBy       : Association to Buyer;
    project_ID: UUID;
    project           : Association to Project on project.ID = project_ID;
    position_ID: UUID;
    position           : Association to Positions_roles on position.ID = position_ID;
    requiredSkills    : String(500);
    estimatedHours    : Integer;
    preferredSupplier : Association to Supplier;
    status            : String enum { Open; Accepted; Ignored } default 'Open';
    ignoreReason      : String(500);
    createdAt         : Timestamp @cds.on.insert : $now  @cds.on.update : $now;
    modifiedAt        : Timestamp @cds.on.insert : $now  @cds.on.update : $now;
}

    // Subtasks
    // subtasks: Association to many Subtask on subtasks.contractorRequest.ID = ID;


// entity Subtask:cuid {
//     contractorRequest: Association to ContractorRequest;
//     description: String;
//     hoursEstimated: Decimal(5,2);
//     status: String enum { Open; InProgress; Completed };
// }

entity ContractorProfile : cuid {
    co_name      : String(100);
    experience   : Integer;
    rate         : Decimal(10,2);
    skills       : String(500);
    status       : String enum { Pending; Approved; Rejected } default 'Pending';
    request      : Association to ContractorRequest;
    submittedBy  : Association to Supplier;

    // Resume upload
    resume       : LargeBinary @Core.MediaType: 'application/pdf'; // no length limit

    createdAt    : DateTime @Core.Computed: true;
    updatedAt    : DateTime @Core.Computed: true;
}

entity Worker:cuid {
    worker_name: String @title : '{i18n>workerName}';
    supplier_ID: UUID @title : '{i18n>supplier_ID}';
    assignedProject_ID: UUID @title : '{i18n>assignedProject_ID}';
    contractorProfile_ID: UUID @title : '{i18n>contractorProfile_ID}';
    supplier: Association to Supplier on supplier.ID = supplier_ID @title : '{i18n>supplier}';
    assignedProject: Association to Project on assignedProject.ID = assignedProject_ID @title : '{i18n>assignedProject}';
    assigned_ProjectManager: Association to ProjectManager;
    contractorProfile: Association to ContractorProfile on contractorProfile.ID = contractorProfile_ID @title : '{i18n>contractorProfile}';
    w_email: email @title : '{i18n>w_email}';
}

entity TimesheetEntry:cuid{
    worker: Association to Worker;
    project: Association to Project;
    date: Date;
    hoursWorked: Decimal(5,2);
    status: String enum { Submitted; Approved; Rejected };
    percentComplete: Integer;
    supportDocument: LargeBinary @Core.MediaType: 'application/pdf';
    rejectionComment: String;  
    lastModified: Timestamp;

    // Actual cost for accounting
    costTaken: Decimal(10,2);

    // Virtual fields for project tracking
    // virtual actualCost: Decimal(10,2);    // hoursWorked * worker rate
    // virtual earnedValue: Decimal(10,2);   // (percentComplete/100) * plannedValue
    // virtual plannedValue: Decimal(10,2);  // project.plannedHours * project.hourlyRate
}