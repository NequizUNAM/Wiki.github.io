/*! Copyright (C) Microsoft. All rights reserved. */

window.TelemetryLogging = (function () {
	var events = {
		'capturePageAction': 'capturePageAction',
		'captureContentUpdate': 'captureContentUpdate'
	};

	function sendEvent(event, overrideTags, element, customProperties) {
		if (typeof window.analytics === 'object') {
			if (typeof element === 'undefined') {
				element = null;
			}

			if (typeof customProperties === 'undefined') {
				customProperties = null;
			}

			if (event === events.capturePageAction) {
				window.analytics.capturePageAction(element, overrideTags, customProperties);
			}
			else if (event) {
				window.analytics.captureContentUpdate(overrideTags, customProperties);
			}
		}
	}

	return {
		events: events,
		sendEvent: sendEvent
	};
})();
