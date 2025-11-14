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
    @UI.Hidden : true
    supplier_ID: UUID;
    project: Association to Project on project.ID = project_ID;
    buyer_ID     : UUID @title : '{i18n>BuyerID}';
    project_manager_ID: UUID;
    //worker_ID : UUID @title : '{i18n>WorkerID}';
    project_manager: Association to ProjectManager on project_manager.ID = project_manager_ID;
    //worker : Association to  many Worker on worker.ID = worker_ID @title : '{i18n>Worker}';
    workers: Composition of many Worker on workers.assignedPosition_ID = $self.ID;
    supplier: Association to Supplier on supplier.ID = supplier_ID;
    buyer        : Association to Buyer on buyer.ID = buyer_ID @title : '{i18n>Buyer}';
    contractor_req: Composition of many ContractorRequest on contractor_req.position_ID =$self.ID;

    tasks : Composition of many Task on tasks.position_ID = $self.ID;

    @Semantics.amount.currencyCode: 'currency_code'
    hourlyRate: Decimal(10,2) @title : '{i18n>hourlyRate}';
    currency_code: String(3);
    description: String @UI.multiLineText: true;
    @title : 'Status (Open/Close)'
    status            : String enum { Open; Close;} default 'Open' ;
    @UI.Hidden : true
    ColorCoding : Integer @virtual;
}

entity Project:cuid {
    project_name: String @default: 'Unknown' @title : '{i18n>project_name}';
    project_manager_ID : UUID @title : '{i18n>project_manager_ID}';
    project_manager: Association to ProjectManager on project_manager.ID  = project_manager_ID @title : '{i18n>project_manager}';
    startDate: Date @title : '{i18n>startDate}';
    endDate: Date @title : '{i18n>endDate}';
    positions: Composition of many Positions_roles on positions.project_ID = $self.ID;
    plannedHours: Integer @title : '{i18n>plannedHours}';
}

entity ContractorRequest : cuid {
    requestedBy_ID: UUID;
    requestedBy : Association to Buyer on requestedBy.ID = requestedBy_ID;
    position_ID : UUID;
    position           : Association to Positions_roles on position_ID = $self.ID;
    //pos_detail: Association to Positions_roles;
    requiredSkills    : String(500);
    //status            : String enum { Open; Accepted; Ignored } default 'Open';
    //ignoreReason      : String(500);
    createdAt         : Timestamp @cds.on.insert : $now @cds.on.update : $now;
    modifiedAt        : Timestamp @cds.on.insert : $now @cds.on.update : $now;


    requestsupplier : Composition of many RequestSuppliers on requestsupplier.c_request = $self;

    

    // @UI.DataFieldForAction: true
    // action Send() returns Boolean;
}

@assert.unique: {
  uniqueSupplierPerRequest: [c_request_ID, supplier_ID]
}
entity RequestSuppliers : cuid, managed {


  c_request_ID : UUID not null;
  c_request       : Association to ContractorRequest on c_request.ID = c_request_ID;
  supplier_ID: UUID not null;
  supplier      : Association to Supplier on supplier.ID = supplier_ID;

  // 🧭 Enum-based status field
  status        : String enum {
    Accepted;
    Pending;
  } default 'Pending';


  responseDate  : DateTime;

  responses     : Composition of many ContractorProfile on responses.request = $self;

  

  //unique uniqueSupplierPerRequest on (request_ID, supplier_ID);
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
    contractor_ID: UUID not null;
    supplier_ID : UUID;
    contractor : Association to Contractors on contractor.ID = contractor_ID;
    status       : String enum { Pending; Selected; Rejected } default 'Pending';
    request      : Association to RequestSuppliers;
    supplier  : Association to Supplier on supplier.ID = supplier_ID ;
}

entity Worker:cuid {
    
    @UI.Hidden : true
    supplier_ID: UUID @title : '{i18n>supplier_ID}';
    @mandatory
    assignedProject_ID: UUID @title : '{i18n>assignedProject_ID}';
    contractorProfile_ID: UUID @title : '{i18n>contractorProfile_ID}';
    @readonly
    assignedPosition_ID: UUID; // <-- the FK that links to Positions_roles

    @mandatory                      // <-- Make ProjectManager mandatory
    assigned_ProjectManager_ID: UUID;
    supplier: Association to Supplier on supplier.ID = supplier_ID @title : '{i18n>supplier}';
    assignedProject: Association to Project on assignedProject.ID = assignedProject_ID @title : '{i18n>assignedProject}';
    assigned_ProjectManager: Association to ProjectManager on assigned_ProjectManager.ID = assigned_ProjectManager_ID;
    assignedPosition : Association to Positions_roles on assignedPosition.ID = assignedPosition_ID;
    contractorProfile: Association to ContractorProfile on contractorProfile.ID = contractorProfile_ID @title : '{i18n>contractorProfile}';
    timeSheets : Composition of many WorkerTimeSheet on timeSheets.worker_ID = $self.ID;
}

entity Contractors: cuid,managed{
    supplier_ID : UUID;
    supplier     : Association to Supplier on supplier.ID = supplier_ID;
    co_name     : String(100);
    skills       : String(200);
    experience   : Integer;
    rate         : Decimal(3,2);
    // Resume upload
    resume       : LargeBinary @Core.MediaType: 'application/pdf'; // no length limit
    resumeName   : String(255);
}

// entity TimesheetEntry:cuid{
//     worker: Association to Worker;
//     project: Association to Project;
//     date: Date;
//     hoursWorked: Decimal(5,2);
//     status: String enum { Submitted; Approved; Rejected };
//     percentComplete: Integer;
//     supportDocument: LargeBinary @Core.MediaType: 'application/pdf';
//     rejectionComment: String;  
//     lastModified: Timestamp;

//     // Actual cost for accounting
//     costTaken: Decimal(10,2);

//     // Virtual fields for project tracking
//     // virtual actualCost: Decimal(10,2);    // hoursWorked * worker rate
//     // virtual earnedValue: Decimal(10,2);   // (percentComplete/100) * plannedValue
//     // virtual plannedValue: Decimal(10,2);  // project.plannedHours * project.hourlyRate
// }


entity WorkerTimeSheet : cuid, managed {
    worker_ID   : UUID;
    worker      : Association to Worker on worker.ID = worker_ID;
    weekStart   : Date;
    weekEnd     : Date;
    totalhours  : Decimal(4,2);
    @readonly
    bonus       : String(2000);
    status      : String enum { Pending; Approved; Rejected} default 'Pending' ;
    rejectedreason : String(2000);
    comments    : String(2000);

    timeEntries : Composition of many TimeEntry on timeEntries.timesheet_ID = $self.ID;
}

// TimeEntry entity: linked to TimeSheet and Task
entity TimeEntry : cuid, managed {
    timesheet_ID : UUID;
    timesheet           : Association to WorkerTimeSheet on timesheet.ID = timesheet_ID;
    workDate            : Date;
    tasks_ID             : UUID;
    tasks                : Association to WorkerTaskAssignment on tasks.ID = tasks_ID;
    hours               : Decimal(4,2);
    notes               : String(255);
}


// view TimeEntriesInWeek(weekStart: Date, weekEnd: Date) as select from TimeEntry
// where workDate between :weekStart and :weekEnd;

// Task entity (existing)
entity Task : cuid {
    description         : String;
    isBillable          : Boolean;
    position_ID : UUID;
    position : Association to Positions_roles on position.ID = position_ID;

    assignments : Composition of many WorkerTaskAssignment on assignments.task_ID = $self.ID;
}

entity WorkerTaskAssignment : cuid {
  @readonly
  task_ID : UUID;
  task : Association to Task on task.ID = task_ID;

  worker_ID : UUID;
  worker : Association to Worker on worker.ID = worker_ID;
}