# ------------------------------------------------------------------------------
# Copyright 2017 Frank Breedijk
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
package Seccubus::Controller::Scanners;
#use parent Seccubus::Controller;
use Mojo::Base 'Mojolicious::Controller';

use strict;

use lib "..";
use SeccubusV2;
use Seccubus::Scanners;

# List
sub list {
	my $self = shift;

#	eval {
		my $data = [];
		my $scanners = get_scanners(); # Get somethin here

		foreach my $row ( @$scanners ) {
			push (@$data, {
				'name'		=> $$row[0],
				'description'	=> $$row[1],
				'help'		=> $$row[2],
				'params'	=> $$row[3],
			});
		}
		#die Dumper $data;
		$self->render(
			json => $data
		);
#	} or do {
#		$self->error(join "\n", $@);
#	};
}

1;
