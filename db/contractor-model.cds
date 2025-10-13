namespace com.contractor.timesheet;

entity Buyer {
    key ID: UUID;
    name: String;
    department: String;
}

entity Supplier {
    key ID: UUID;
    name: String;
    contactEmail: String;
}

entity Project {
    key ID: UUID;
    name: String;
    buyer: Association to Buyer;
    startDate: Date;
    endDate: Date;
    plannedHours: Integer;
    hourlyRate: Decimal(10,2);
    
    // Aggregated fields
    virtual totalHoursWorked: Decimal(10,2);
    virtual totalCost: Decimal(10,2);
    virtual progressPercent: Decimal(5,2);
}

entity ContractorRequest {
    key ID: UUID;
    requestedBy: Association to Buyer;
    project: Association to Project;    
    requiredSkills: String;
    startDate: Date;
    endDate: Date;
    estimatedHours: Integer;
    preferredSupplier: Association to Supplier;
    status: String enum { Open; Submitted; Fulfilled; Cancelled };

    // Subtasks
    subtasks: Association to many Subtask on subtasks.contractorRequest.ID = ID;
}

entity Subtask {
    key ID: UUID;
    contractorRequest: Association to ContractorRequest;
    description: String;
    hoursEstimated: Decimal(5,2);
    status: String enum { Open; InProgress; Completed };
}

entity ContractorProfile {
    key ID: UUID;
    name: String;
    experience: Integer;
    rate: Decimal(10,2);
    skills: String;
    status: String enum { Pending; Shortlisted; Rejected; Selected };
    request: Association to ContractorRequest;
    submittedBy: Association to Supplier;
    resume: LargeBinary @Core.MediaType: 'application/pdf';
}

entity Worker {
    key ID: UUID;
    name: String;
    supplier: Association to Supplier;
    assignedProject: Association to Project;
    contractorProfile: Association to ContractorProfile;
    email: String;
}

entity TimesheetEntry {
    key ID: UUID;
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
    virtual actualCost: Decimal(10,2);    // hoursWorked * worker rate
    virtual earnedValue: Decimal(10,2);   // (percentComplete/100) * plannedValue
    virtual plannedValue: Decimal(10,2);  // project.plannedHours * project.hourlyRate
}