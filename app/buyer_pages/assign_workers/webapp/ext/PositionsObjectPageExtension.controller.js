sap.ui.define([
  "sap/ui/core/mvc/Controller",
  "sap/ui/model/json/JSONModel",
  "sap/m/SelectDialog",
  "sap/m/Token"
], function(Controller, JSONModel, SelectDialog, Token) {
  "use strict";

  return Controller.extend("com.contractor.assignworkers.controller.PositionsObjectPageExtension", {

    onInit: function() {
      var oModel = new JSONModel({ selectedTokens: [], AvailableWorkers: [] });
      this.getView().setModel(oModel);

      // Load Workers from OData Model
      this.getOwnerComponent().getModel().read("/Workers", {
        success: function(data) {
          oModel.setProperty("/AvailableWorkers", data.results);
        }
      });
    },

    onWorkerValueHelp: function() {
      if (!this._workerDialog) {
        this._workerDialog = new SelectDialog({
          title: "Select Workers",
          multiSelect: true,
          items: {
            path: "/AvailableWorkers",
            template: new sap.m.StandardListItem({
              title: "{co_name}",
              description: "{supplier/supplier_name}",
              key: "{ID}"
            })
          },
          confirm: this._onWorkerDialogConfirm.bind(this)
        });
        this.getView().addDependent(this._workerDialog);
      }

      // Open the dialog
      this._workerDialog.open();
    },

    _onWorkerDialogConfirm: function(oEvent) {
      var selectedItems = oEvent.getParameter("selectedItems");
      var tokens = [];
      selectedItems.forEach(item => {
        tokens.push(new Token({
          key: item.getKey(),
          text: item.getTitle(),
        }));
      });

      var oView = this.getView();
      oView.byId("multiWorkerInput").setTokens(tokens);
      oView.getModel().setProperty("/selectedTokens", tokens);

      // Store selected IDs
      var selectedIDs = selectedItems.map(item => item.getKey());
      oView.getModel().setProperty("/selectedWorkerIDs", selectedIDs);
    }

  });
});
