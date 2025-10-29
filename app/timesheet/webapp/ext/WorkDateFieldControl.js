sap.ui.define([], function () {
  "use strict";
  return function (oField, oContext) {
    // Try to get weekStart and weekEnd via association
    let timesheet = oContext.getProperty("timesheet");
    if (timesheet && timesheet.weekStart && timesheet.weekEnd) {
      oField.setMinDate(new Date(timesheet.weekStart));
      oField.setMaxDate(new Date(timesheet.weekEnd));
    }
    return 1; // 1: editable, 0: read-only, -1: hidden
  };
});