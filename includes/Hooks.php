<?php

namespace Wikimedia\MobileView;

class Hooks {

	/**
	 * onUnitTestsList listener.
	 *
	 * Adds the path to the MobileView PHPUnit tests to the set of enabled
	 * extension's test suites.
	 *
	 * @param array $paths The set of paths to other extension's PHPUnit test
	 *  suites
	 */
	public static function onUnitTestsList( array &$paths ) {
		$paths[] = __DIR__ . '/../tests/phpunit';
	}
}
