const cds = require("@sap/cds");

module.exports = cds.service.impl(async function () {
    const {Timesheet} = this.entities;

    this.before(['CREATE', 'PATCH', 'UPDATE'],Timesheet , req => {
        if(String(req.data.status) === 'Rejected' && (!rejectedreason || rejectedreason.trim() === '')){
            req.error(500, 'Rejected Reason must be provided when status is Rejected.' );
        }
  });
});