/*! Copyright (C) Microsoft. All rights reserved.       */

(function ($) {
	// Closes the active TopNavigation menu.
	function shrinkActiveMenu() {
		var $topNavActiveCategory = $(".topNavActiveCategory:not(#topNavMobileDropdownButton)");
		$topNavActiveCategory.children("a").attr('aria-expanded', 'false');
		$topNavActiveCategory.children("a").attr('data-bi-bhvr', 'EXPAND');
		$topNavActiveCategory.children("ul").removeClass("activeMenu");
		$(".topNavDropdownMenu").removeClass("activeMenu");
		$topNavActiveCategory.removeClass("topNavActiveCategory");
	}

	// Shrinks the mobile menu, including the submenus within it.
	function shrinkMobileMenu() {
		var $dropdownButton = $("#topNavMobileDropdownButton");
		$dropdownButton.removeClass("topNavActiveCategory");
		$dropdownButton.children("a").attr('aria-expanded', 'false');
		$dropdownButton.children("a").attr('data-bi-bhvr', 'EXPAND');
		shrinkActiveMenu();
		$("#topNavCategories").removeClass("activeMenu");
	}

	//Toggle TopNavigation menu in Moobile view
	$('.topNavMobileCategory').click(function () {
		var $target = $(this);
		var selected = $target.hasClass("topNavActiveCategory");

		if (selected) {
			shrinkMobileMenu();
		}else {
			$target.addClass("topNavActiveCategory");
			$target.children("a").attr('aria-expanded', 'true');
			$target.children("a").attr('data-bi-bhvr', 'REDUCE');
			$("#topNavCategories").addClass("activeMenu");
		}
	});

	//Toggle TopNavigation menu in regular view
	$('.topNavCategory').click(function () {
		var $target = $(this);
		var selected = $target.hasClass("topNavActiveCategory");
		shrinkActiveMenu();

		if (!selected) {
			$target.addClass("topNavActiveCategory");
			$target.children("a").attr('aria-expanded', 'true');
			$target.children("a").attr('data-bi-bhvr', 'REDUCE');
			$target.children("ul").addClass("activeMenu");
		} 
	});

	//Toggle TopNavigation menu via keyboard ESC key press
	$('.topNavCategory').keyup(function (e) {
		if (e.keyCode == 27) {
			shrinkActiveMenu();
		}
	});

	// Resizes the window to be mobile/tablet vs desktop screen.
	// Dependent on id values for the nav remaining the same.
	$(window).resize(function () {
		shrinkMobileMenu();
	});

	// Close menu if click outside the active menu
	$(document).click(function (event) {
		if (!$(event.target).closest('.activeMenu').length
			&& !$(event.target).closest('.topNavMobileCategory').length
			&& !$(event.target).closest('.topNavCategory').length) {
			shrinkActiveMenu();
			shrinkMobileMenu();
		}
	});
})(jQuery);
