const cds = require("@sap/cds");

module.exports = cds.service.impl(async function() {

    const {Positions} = this.entities;

// srv/manager-service.js or srv/buyer-service.js
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