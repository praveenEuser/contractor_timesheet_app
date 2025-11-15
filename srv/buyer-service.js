const cds = require("@sap/cds");
const { Positions_roles, ContractorRequest, RequestSuppliers } = cds.entities('com.contractor.timesheet');
const { SELECT } = require("@sap/cds/lib/ql/cds-ql");

module.exports = cds.service.impl(async function() {


    


    const { Positions, ContractorRequestEntity, RequestSuppliers } = this.entities;

        this.after('READ', 'Positions', each => {
            switch (each.status) {
                case 'Open':
                each.ColorCoding = 3; // Green
                break;
                case 'Close':
                each.ColorCoding = 1; // Red
            };
        });

        this.on('READ', 'Currencies', () => {
            return [
            { code: 'USD', name: 'US Dollar' },
            { code: 'EUR', name: 'Euro' },
            { code: 'INR', name: 'Indian Rupee' },
            // add more as needed
            ];
        });

        this.after('READ', 'RequestSuppliers', each => {
            switch (each.status) {
                case 'Approved':
                each.ColorCoding = 3; // Green
                break;
                case 'Pending':
                each.ColorCoding = 2; // Yellow
            };
        });


        
});
