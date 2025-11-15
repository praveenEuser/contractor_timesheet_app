const cds = require("@sap/cds");

module.exports = cds.service.impl(async function() {

  const { TimeSheetEntity, TimeEntryEntity, WorkerTimeSheet } = this.entities;
  
        this.before(['CREATE', 'UPDATE'], 'TimeSheetEntity', req => {
          const { totalhours } = req.data;

          if (totalhours !== undefined) {
            if (totalhours > 50) {
              req.data.bonus = 'Applicable';
            } else {
              req.data.bonus = 'Not Applicable';
            }
          }
        });




});
