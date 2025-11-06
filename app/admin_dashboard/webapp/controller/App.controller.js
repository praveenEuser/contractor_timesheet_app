sap.ui.define([
  "sap/ui/core/mvc/Controller",
  "sap/ui/model/json/JSONModel",
  "sap/m/MessageToast"
], (BaseController, JSONModel, MessageToast) => {
  "use strict";

  return BaseController.extend("com.contractor.admin.admindashboard.controller.App", {
      onInit: function () {
      var oModel = new JSONModel({
        tiles: [
          {
            title: "Managers",
            subtitle: "Manager Details",
            icon: "sap-icon://manager",
            url: "/admin_pages/managers/webapp/index.html"
          },
          {
            title: "Suppliers",
            subtitle: "View all suppliers",
            icon: "sap-icon://supplier",
            url: "/admin_pages/suppliers/webapp/index.html"
          },
          {
            title: "Buyers",
            subtitle: "Buyer details",
            icon: "sap-icon://customer",
            url: "/admin_pages/buyers/webapp/index.html"
          }
          // {
          //   title: "Workers",
          //   subtitle: "Worker information",
          //   icon: "sap-icon://employee",
          //   url: "/admin_pages/workers/webapp/index.html"
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