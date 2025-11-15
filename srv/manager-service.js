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




    

});
