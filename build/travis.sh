#!/bin/bash

# Copyright (C) 2015 Sam Smith <git@samsmith.io>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

set -e

cd $(mktemp --directory)
git clone https://github.com/wikimedia/mediawiki

cd mediawiki
composer install

# Install the MobileFrontend and MobileView extensions.
# FIXME: Should MobileView be built against a specific version of
# MobileFrontend?
cd extensions
git clone --branch=removeMobileApi https://github.com/phuedx/mediawiki-extensions-MobileFrontend MobileFrontend
ln -s $TRAVIS_BUILD_DIR MobileView

cd .. # cd extensions

php tests/phpunit/phpunit.php \
	--conf extensions/MobileView/build/LocalSettings.php \
	extensions/MobileView/tests/phpunit/
