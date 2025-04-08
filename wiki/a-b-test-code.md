---
layout: post
title: "JavaScript Static Website A/B Test Code Example"
date: 2025-04-08
tags: js, code, programming, front-end, frontend
description: "A reservoir for the JavaScript code that powers A/B tests on this site. Feel free to borrow it."
abstract: "A reservoir for the JavaScript code that powers A/B tests on this site. Feel free to borrow it."
language: English
importance: 4
---

A function that checks for nightmode and assigns a new or old style (A vs B) with a certain probability

```js
function selectDesign() {
	const randomValue = Math.random();
	const prefersDarkMode = window.matchMedia('(prefers-color-scheme: dark)').matches;
	const darkTheme = document.documentElement.getAttribute('data-theme') === 'dark';
	const darkLight = (prefersDarkMode || darkTheme) ? "dark" : "light";
	const version = randomValue > 0.5 ? 'New' : 'Old';
	return {darkLight, version};
}
```

A function for applying the new style if the designVersion is the new one. This can trivially generalize to A/B/C testing, etc.

```js
function applyDesign(designVersion) {
  if (designVersion.version === 'New') {
	const styleEl = document.createElement('style');
	styleEl.id = '$ID';

	// Remove any previous override first
	const existingStyle = document.getElementById('$ID');
	if (existingStyle) {
	   existingStyle.remove();
	}

	// New rule that specifically overrides the root --max-content-width 
	//styleEl.textContent = `:root {--max-content-width: 80ch;}`;
	styleEl.textContent = `$NEW_STYLE`;
	document.head.appendChild(styleEl);
  }
}
```

Finally, the main function with the A/B test loop and telemetry calls.

```js
// Log events to Google Analytics
function logEvent(eventName, designVersion) {
  gtag('event', eventName, designVersion);
}

// Main function to initialize A/B test
function initABTest() {
  // Select design version
  const designVersion = selectDesign();
  // Apply the selected design
  applyDesign(designVersion);
  const designVersionString = `${designVersion.darkLight}_${designVersion.version}`;
  // Log page load event with design version
  logEvent(`page_loaded_${designVersionString}`, designVersion);
  // Add X time on site events for engagement tracking, but a different event could've been chosen.
  setTimeout(() => {
    logEvent(`one_minute_engagement_${designVersionString}`, designVersion);
  }, 60000);
  setTimeout(() => {
    logEvent(`five_minute_engagement_${designVersionString}`, designVersion);
  }, 300000);

}

// Run the A/B test when the page loads
window.addEventListener('DOMContentLoaded', initABTest);
```