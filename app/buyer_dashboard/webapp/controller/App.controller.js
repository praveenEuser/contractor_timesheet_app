sap.ui.define([
  "sap/ui/core/mvc/Controller",
  "sap/ui/model/json/JSONModel",
  "sap/m/MessageToast"
], (BaseController, JSONModel, MessageToast) => {
  "use strict";

  return BaseController.extend("com.contractor.buyerdashboard.buyerdashboard.controller.App", {
      onInit: function () {
      var oModel = new JSONModel({
        tiles: [
          {
            title: "Projects",
            subtitle: "Project Details",
            icon: "sap-icon://activity-assigned-to-goal",
            url: "/buyer_pages/projects/webapp/index.html"
          },
          {
            title: "Contractor Requests",
            subtitle: "Contractor Requests",
            icon: "sap-icon://request",
            url: "/buyer_pages/contractor_req/webapp/index.html"
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