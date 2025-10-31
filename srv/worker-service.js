const cds = require("@sap/cds");

module.exports = cds.service.impl(async function() {

  const { TimeSheetEntity, TimeEntryEntity, WorkerTimeSheet } = this.entities;

  this.before('CREATE', 'TimeSheetEntity', (req) => {
    req.data.worker_ID = '6409eb4f-43ad-4f05-98fb-6ab858ec96f3'; // For dev/testing
  });

//   this.before(['CREATE', 'UPDATE'], 'TimeEntryEntity', async req => {
//     console.log("[CAP HOOK] TimeEntry hook called. req.data:", req.data);

//     let timesheetID = req.data.timesheet_ID;
//     if (!timesheetID && req.data.timesheet && typeof req.data.timesheet === 'object') {
//         timesheetID = req.data.timesheet.ID;
//     } else if (!timesheetID && typeof req.data.timesheet === 'string') {
//         timesheetID = req.data.timesheet;
//     }
//     console.log("[CAP HOOK] Calculated timesheetID:", timesheetID);

//     const workDate = req.data.workDate;
//     if (timesheetID && workDate) {
//         const ts = await cds.tx(req).run(
//         SELECT.one.from('WorkerTimeSheet').where({ ID: timesheetID })
//         );
//         console.log("[CAP HOOK] WorkerTimeSheet result:", ts);

//         if (ts && (workDate < ts.weekStart || workDate > ts.weekEnd)) {
//         console.log("[CAP HOOK] Out of range! Blocking...");
//         req.error(400, `WorkDate must be between weekStart (${ts.weekStart}) and weekEnd (${ts.weekEnd})`);
//         }
//     }
//     });


        async function updateTimesheetTotal(timesheetID, tx) {
          const sumResult = await tx.run(
            SELECT.one.from('ct.TimeEntry')
              .columns('sum(hours) as total')
              .where({ timesheet_ID: timesheetID })
          );
          await tx.run(
            UPDATE('ct.WorkerTimeSheet')
              .set({ totalhours: sumResult.total || 0 })
              .where({ ID: timesheetID })
          );
          console.log(`Updated timesheet (${timesheetID}) totalhours = ${sumResult.total || 0}`);
        }

        this.after(['CREATE', 'UPDATE', 'DELETE', 'PATCH'], 'TimeEntryEntity', async (data, req) => {
          // Get transaction from request
          const tx = cds.tx(req);

          let timesheetID =
            data.timesheet_ID ||
            (data.timesheet && data.timesheet.ID) ||
            (req.data && req.data.timesheet_ID) ||
            (req.data && req.data.timesheet && req.data.timesheet.ID);

          if (!timesheetID && req.params && req.params.length) {
            timesheetID = req.params[0].ID;
          }

          if (timesheetID) {
            await updateTimesheetTotal(timesheetID, tx);
          } else {
            console.warn('No timesheetID found for update totalhours');
          }
        });

        this.after('draftActivate', 'TimeEntryEntity', async (data, req) => {
          const tx = cds.transaction(req);
          let timesheetID = data.timesheet_ID || (data.timesheet && data.timesheet.ID);
          if (timesheetID) {
            await updateTimesheetTotal(timesheetID, tx);
          } else {
            console.warn('No timesheetID found for draftActivate');
          }
        });




});
