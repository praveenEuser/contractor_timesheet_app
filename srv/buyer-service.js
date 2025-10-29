const cds = require("@sap/cds");
const { Positions_roles, ContractorRequest, RequestSuppliers } = cds.entities('com.contractor.timesheet');
const { SELECT } = require("@sap/cds/lib/ql/cds-ql");

module.exports = cds.service.impl(async function() {


    


    const { Positions, ContractorRequestEntity, RequestSuppliers } = this.entities;


    // After draft activation of Positions (i.e., after pressing Save in main page)
    this.on('draftActivate', 'Positions', async (req) => {
        try {
            const position_ID = req.data?.ID || req.data?.position_ID;
            if (!position_ID) {
                console.log('Missing Position ID in draftActivate:', req.data);
                return;
            }

            const tx = cds.transaction(req);

            // Fetch related contractor requests for the position
            const contractorRequests = await tx.run(
                SELECT.from(ContractorRequestEntity)
                    .columns('ID')
                    .where({ position_ID })
            );

            if (!contractorRequests.length) return;

            const contractorRequestIDs = contractorRequests.map(r => r.ID);

            // Update related RequestSuppliers' status from Pending to Sent
            await tx.run(
                UPDATE(RequestSuppliers)
                    .set({ status: 'Sent' })
                    .where({
                        c_request_ID: { in: contractorRequestIDs },
                        status: 'Pending'
                    })
            );

            console.log(`Updated RequestSuppliers status to Sent for Position: ${position_ID}`);

        } catch (error) {
            console.error('Error during draftActivate handler:', error);
            throw error;  // propagate error to CAP framework
        }
    });


// srv/manager-service.js or srv/buyer-service.js
        this.after('READ', 'Positions', each => {
        switch (each.status) {
            case 'Open':
            each.ColorCoding = 3; // Green
            break;
            case 'Close':
            each.ColorCoding = 1; // Red
        };

        // this.after('UPDATE', 'Positions', async (req, result) => {
        //     // Find the position ID (from payload or params)
        //     const position_ID = req.data.ID || (req.params && req.params[0]);

        //     if (!position_ID) return;

        //     // Update all RequestSuppliers linked to ContractorRequests for this Position
        //     // Assuming ContractorRequest has position_ID and RequestSuppliers is linked by c_request_ID
        //     const contractorRequests = await cds.tx(req).run(
        //     SELECT.from('ContractorRequest').columns('ID').where({ position_ID })
        //     );

        //     const contractorRequestIDs = contractorRequests.map(row => row.ID);

        //     if (contractorRequestIDs.length === 0) return;

        //     // Update all related RequestSuppliers' status
        //     await cds.tx(req).run(
        //     UPDATE('RequestSuppliers')
        //         .set({ status: 'Sent' })
        //         .where({ c_request_ID: { in: contractorRequestIDs }, status: 'Pending' })
        //     );
        // });


        // this.before('draftActivate', 'RequestSuppliers', async (req) => {
        //     const { c_request_ID, supplier_ID } = req.data;

        //     if (!c_request_ID || !supplier_ID) {
        //         return req.error(400, 'Missing required c_request_ID or supplier_ID in draft activation.');
        //     }

        //     const exists = await cds.transaction(req).run(
        //         SELECT.one.from('RequestSuppliers')
        //         .where({ c_request_ID, supplier_ID })
        //     );

        //     if (exists) {
        //         return req.error(409, 'Cannot activate draft: Supplier already assigned to this contractor request.');
        //     }
        // });

        // this.on('error', (err, req) => {
        //     if (err.name === 'ConstraintViolation' && err.message.includes('UNIQUE')) {
        //         return req.reject(409, 'Duplicate supplier assignment detected.');
        //     }
        // });



        this.after(['CREATE', 'UPDATE'], 'Positions', async (position, req) => {
            if (position.worker_ID) {
                await cds.update('com.contractor.timesheet.Worker').set({
                assignedPosition_ID: position.ID,
                assignedProject_ID: position.project_ID,
                supplier_ID: position.supplier_ID,
                assigned_ProjectManager: position.project_manager_ID
                }).where({ ID: position.worker_ID });
            }
        });

        





    });


});