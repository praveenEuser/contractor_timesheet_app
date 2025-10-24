sap.ui.define([
  "sap/ui/core/mvc/ControllerExtension"
], function(ControllerExtension) {
  "use strict";

  return ControllerExtension.extend("com.contractor.requests.ext.ObjectPageExt", {
    onInit: function() {
      var that = this;
      // Attach event to UI model to listen for Edit mode change
      this.getView().getModel("ui").attachPropertyChange(function(oEvent) {
        if (oEvent.getParameter("path") === "/editable" && oEvent.getParameter("value") === true) {
          // Wait for Save button to appear and then change text
          setTimeout(function() {
            var oSaveButton = that.byId("fe::FooterBar::StandardAction::Save");
            if (oSaveButton) {
              oSaveButton.setText("Send");
            }
          }, 500);  // Delay to ensure button is rendered
        }
      });
    }
  });
});
