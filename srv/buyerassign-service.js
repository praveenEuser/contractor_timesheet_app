const cds = require("@sap/cds");
const { SELECT } = require("@sap/cds/lib/ql/cds-ql");

// For composition: executed when a new Worker is created under Positions
module.exports = cds.service.impl(function () {
  const { Positions_roles } = this.entities;

  this.before('CREATE', 'Worker', async req => {
    const { assignedPosition_ID } = req.data;
    if (assignedPosition_ID) {
      // Fetch parent Position
      const parent = await cds.run(
        SELECT.one
        .from(Positions_roles)
        .where({ ID: assignedPosition_ID })
      );
      if (parent) {
        // Autofill on worker
        req.data.assignedProject_ID = parent.project_ID;
        req.data.assigned_ProjectManager_ID = parent.project_manager_ID;
      }
    }
  });
});
