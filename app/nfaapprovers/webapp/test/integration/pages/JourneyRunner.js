sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"nfaapprovers/test/integration/pages/RulesList",
	"nfaapprovers/test/integration/pages/RulesObjectPage"
], function (JourneyRunner, RulesList, RulesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('nfaapprovers') + '/test/flp.html#app-preview',
        pages: {
			onTheRulesList: RulesList,
			onTheRulesObjectPage: RulesObjectPage
        },
        async: true
    });

    return runner;
});

