const cds = require("@sap/cds");

module.exports = cds.service.impl(async function () {
    const { Projects,Currencies } = this.entities;

    const { ContractorRequests, ContractorProfiles, Positions } = this.entities;


    this.before('CREATE', 'Projects', (req) => {
        // List all mandatory fields
        const mandatoryFields = [
            'project_name',
            'startDate',
            'endDate',
            'plannedHours'
        ];

        for (const field of mandatoryFields) {
            if (!req.data[field]) {
                // Throw an error if missing
                req.error(400, `${field} is mandatory and cannot be empty`);
            }
        }
    });

    this.on('READ', 'Currencies', () => {
    return [
      { code: 'USD', name: 'US Dollar' },
      { code: 'EUR', name: 'Euro' },
      { code: 'INR', name: 'Indian Rupee' },
      // add more as needed
    ];
  });


    this.after('READ', 'Positions', each => {
        switch (each.status) {
            case 'Open':
            each.ColorCoding = 3; // Green
            break;
            case 'Close':
            each.ColorCoding = 1; // Red
        }
    });




    // Supplier accepts request
    this.on('acceptRequest', async (req) => {
        await UPDATE(ContractorRequests)
            .set({ status: 'Accepted' })
            .where({ ID: req.data.requestID });
        return 'Request accepted. Supplier can now submit contractor profiles.';
    });

    // Supplier ignores request
    this.on('ignoreRequest', async (req) => {
        const { requestID, reason } = req.data;
        if(!reason) req.error(400, 'Reason is mandatory to ignore request');
        await UPDATE(ContractorRequests)
            .set({ status: 'Ignored', ignoreReason: reason })
            .where({ ID: requestID });
        return 'Request ignored with reason.';
    });

    // Manager approves contractor profile
    this.on('approveContractorProfile', async (req) => {
        await UPDATE(ContractorProfiles)
            .set({ status: 'Approved' })
            .where({ ID: req.data.profileID });
        return 'Contractor profile approved';
    });

    // Manager rejects contractor profile
    this.on('rejectContractorProfile', async (req) => {
        await UPDATE(ContractorProfiles)
            .set({ status: 'Rejected' })
            .where({ ID: req.data.profileID });
        return 'Contractor profile rejected';
    });

    // Supplier can create profiles only for accepted requests
    this.before('CREATE', 'ContractorProfile', async (req) => {
        const { request_ID } = req.data;
        const request = await SELECT.one.from(ContractorRequests).where({ ID: request_ID });
        if(!request) req.error(404,'Request not found');
        if(request.status !== 'Accepted') req.error(400,'Cannot submit profile for request not accepted');

        // Automatically assign supplier
        req.data.submittedBy_ID = cds.context.user.id;
    });

    // Filter ContractorRequests for logged-in supplier
    this.before('READ','ContractorRequests', (req) => {
        const userId = cds.context.user.id;
        req.query.where({ preferredSupplier_ID: userId });
    });


});
