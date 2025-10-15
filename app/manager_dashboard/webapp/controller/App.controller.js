sap.ui.define([
  "sap/ui/core/mvc/Controller",
  "sap/ui/model/json/JSONModel",
  "sap/m/MessageToast"
], function (Controller, JSONModel, MessageToast) {
  "use strict";

  return Controller.extend("com.contractor.managerdashboard.managerdashboard.controller.App", {

    onInit: function () {
      var oModel = new JSONModel({
        tiles: [
          // {
          //   title: "Supplier List",
          //   subtitle: "View all suppliers",
          //   icon: "sap-icon://supplier",
          //   url: "/suppliers/webapp/index.html"
          // },
          {
            title: "Project LR",
            subtitle: "Manage projects",
            icon: "sap-icon://collaborate",
            url: "/projects/webapp/index.html"
          },
          {
            title: "Contractor Request LR",
            subtitle: "Review contractor requests",
            icon: "sap-icon://person-placeholder",
            url: "/contractor_req/webapp/index.html"
          }
          // {
          //   title: "Buyer LR",
          //   subtitle: "Buyer details",
          //   icon: "sap-icon://customer",
          //   url: "/buyers/webapp/index.html"
          // }
          // {
          //   title: "Worker LR",
          //   subtitle: "Worker information",
          //   icon: "sap-icon://employee",
          //   url: "/workers/webapp/index.html"
          // }
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
