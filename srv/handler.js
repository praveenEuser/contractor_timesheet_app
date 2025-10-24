const cds = require('@sap/cds');
module.exports = cds.service.impl(async function() {
  const { ContractorRequest, RequestSuppliers } = this.entities;
  this.on('Send', async (req) => {
    const id = req.params[0];
    if (!id) return req.error(400, "ContractorRequest ID missing");
    try {
      await cds.tx(req).run(
        UPDATE(ContractorRequest)
          .set({ status: 'Sent', modifiedAt: new Date() })
          .where({ ID: id })
      );
      await cds.tx(req).run(
        UPDATE(RequestSuppliers)
          .set({ status: 'Sent' })
          .where({ request_ID: id })
      );
      return true;
    } catch (error) {
      return req.error(500, error.message);
    }
  });
});
