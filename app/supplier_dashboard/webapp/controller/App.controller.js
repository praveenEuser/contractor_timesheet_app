sap.ui.define([
  "sap/ui/core/mvc/Controller",
  "sap/ui/model/json/JSONModel",
  "sap/m/MessageToast"
], (BaseController, JSONModel, MessageToast) => {
  "use strict";

  return BaseController.extend("com.contractor.supplierdashboard.supplierdashboard.controller.App", {
      onInit() {
        var oModel = new JSONModel({
          tiles: [
            {
              title: "Contractor Requests",
              subtitle: "Check Contractor Requests",
              icon: "sap-icon://customer-order-entry",
              url: "/supplier_pages/check_contractor_requests/webapp/index.html"
            },
            {
              title: "Contractors",
              subtitle: "Manage Contractors",
              icon: "sap-icon://add-employee",
              url: "/supplier_pages/contractors/webapp/index.html"
            }
          ]
        });

        this.getView().setModel(oModel);
      },

    onTilePress: function (oEvent) {
      var oTile = oEvent.getSource();
      var sUrl = oTile.getBindingContext().getProperty("url");
      if (sUrl) {
        window.open(sUrl, "_blank");
      } else {
        MessageToast.show("No URL defined for this tile.");
      }
    }
  });
});