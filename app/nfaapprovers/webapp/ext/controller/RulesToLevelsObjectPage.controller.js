sap.ui.define(['sap/ui/core/mvc/ControllerExtension'], function (ControllerExtension) {
	'use strict';

	return ControllerExtension.extend('nfaapprovers.ext.controller.RulesToLevelsObjectPage', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		override: {
			/**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf nfaapprovers.ext.controller.RulesToLevelsObjectPage
             */
			onInit: function () {
				debugger
				// sap.ui.getCore().byId("nfaapprovers::Rules_RulesToRulesLevelsObjectPage--fe::EditableHeaderSubSection").setVisible(false)
				// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
				var oModel = this.base.getExtensionAPI().getModel();
			}
		}
	});
});
