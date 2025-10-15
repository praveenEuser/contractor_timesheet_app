sap.ui.define([
    "sap/ui/core/UIComponent",
    "com/contractor/admin/admindashboard/model/models"
], (UIComponent, models) => {
    "use strict";

    return UIComponent.extend("com.contractor.admin.admindashboard.Component", {
        metadata: {
            manifest: "json",
            interfaces: [
                "sap.ui.core.IAsyncContentCreation"
            ]
        },

        init() {
            // call the base component's init function
            UIComponent.prototype.init.apply(this, arguments);

            // set the device model
            this.setModel(models.createDeviceModel(), "device");

            // enable routing
            this.getRouter().initialize();
        }
    });
});