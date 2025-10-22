namespace com.contractor.timesheet;

using { cuid,managed, sap.common.Currencies } from '@sap/cds/common';
using { commons_cds.Email as email} from './common';
 
entity Buyer:cuid {
    buyer_name: String @title : '{i18n>buyer_name}';
    department: String @title : '{i18n>department}';
    b_contactEmail: email @title : '{i18n>b_contactEmail}';
}

entity Supplier:cuid {
    supplier_name: String @title : '{i18n>supplier_name}';
    s_contactEmail: email @title : '{i18n>s_contactEmail}';
    contractors     : Composition of many Contractors on contractors.supplier = $self;
}

entity ProjectManager:cuid {
    Manager_name: String @title : '{i18n>Manager_name}';
    p_contactEmail: email @title : '{i18n>p_contactEmail}';
}

entity Positions_roles:cuid{
    roles: String;
    no_of_positions: Integer;
    project_ID : UUID;
    project: Association to Project on project.ID = project_ID;
    buyer_ID     : UUID @title : '{i18n>BuyerID}';
    project_manager_ID: UUID;
    project_manager: Association to ProjectManager on project_manager.ID = project_manager_ID;
    buyer        : Association to Buyer on buyer.ID = buyer_ID @title : '{i18n>Buyer}';
    contractor_req: Composition of many ContractorRequest on contractor_req.position_ID =$self.ID;
    @Semantics.amount.currencyCode: 'currency_code'
    hourlyRate: Decimal(10,2) @title : '{i18n>hourlyRate}';
    currency_code: String(3);
    description: String @UI.multiLineText: true;
    @title : 'Status (Open/Close)'
    status            : String enum { Open; Close;} default 'Open' ;
    ColorCoding : Integer @virtual;
}

entity Project:cuid {
    project_name: String @default: 'Unknown' @title : '{i18n>project_name}';
    project_manager_ID : UUID @title : '{i18n>project_manager_ID}';
    worker_ID : UUID @title : '{i18n>WorkerID}';
    supplier_ID: UUID;
    project_manager: Association to ProjectManager on project_manager.ID  = project_manager_ID @title : '{i18n>project_manager}';
    worker : Association to Worker on worker.ID = worker_ID @title : '{i18n>Worker}';
    supplier: Association to Supplier on supplier.ID = supplier_ID;
    startDate: Date @title : '{i18n>startDate}';
    endDate: Date @title : '{i18n>endDate}';
    positions: Composition of many Positions_roles on positions.project_ID = $self.ID;
    plannedHours: Integer @title : '{i18n>plannedHours}';
}

entity ContractorRequest : cuid {
    requestedBy_ID: UUID;
    requestedBy : Association to Buyer on requestedBy.ID = requestedBy_ID;
    project_ID: UUID;
    position_ID : UUID;
    project           : Association to Project on project.ID = project_ID;
    position           : Association to Positions_roles on position.ID = position_ID;
    requiredSkills    : String(500);
    //status            : String enum { Open; Accepted; Ignored } default 'Open';
    //ignoreReason      : String(500);
    createdAt         : Timestamp @cds.on.insert : $now @cds.on.update : $now;
    modifiedAt        : Timestamp @cds.on.insert : $now @cds.on.update : $now;


    requestsupplier : Composition of many RequestSuppliers on requestsupplier.request = $self;
}

entity RequestSuppliers : cuid, managed {
  request       : Association to ContractorRequest;
  supplier      : Association to Supplier;

  // 🧭 Enum-based status field
  status        : String enum {
    Sent;
    Accepted;
    Ignored;
    Responded;
  } default 'Sent';

  ignoreReason  : String(255);
  responseDate  : Timestamp;

  responses     : Composition of many ContractorProfile on responses.request = $self;
}


    // Subtasks
    // subtasks: Association to many Subtask on subtasks.contractorRequest.ID = ID;


// entity Subtask:cuid {
//     contractorRequest: Association to ContractorRequest;
//     description: String;
//     hoursEstimated: Decimal(5,2);
//     status: String enum { Open; InProgress; Completed };
// }

entity ContractorProfile : cuid,managed{
    co_name      : String(100);
    experience   : Integer;
    rate         : Decimal(10,2);
    skills       : String(500);
    status       : String enum { Pending; Approved; Rejected } default 'Pending';
    request      : Association to RequestSuppliers;
    supplier  : Association to Supplier;
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

entity Contractors: cuid,managed{
    supplier     : Association to Supplier;
    co_name     : String(100);
    skills       : String(200);
    experience   : Integer;
    rate         : Decimal(10,2);
    // Resume upload
    resume       : LargeBinary @Core.MediaType: 'application/pdf'; // no length limit
    resumeName   : String(255);
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