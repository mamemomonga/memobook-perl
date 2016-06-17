#!/usr/bin/env perl
# vim:set fenc=utf-8 ff=unix ft=perl:
package Application;
use feature 'say';
use utf8;
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/local/lib/perl5";

use Moo;
use Log::Handler;

binmode('STDIN',':utf8');
binmode('STDOUT',':utf8');
binmode('STDERR',':utf8');

has 'log' => (is => 'rw', lazy=>1, default=>sub {
	Log::Handler->new(
		screen => {
			log_to   => "STDERR",
			maxlevel => "debug",
			minlevel => "emerg",
			timeformat => '%Y/%m/%d %H:%M:%S',	
			message_layout => "%T [%L] %m"
		},
		file => {
			filename => "file.log",
			maxlevel => "debug",
			minlevel => "warning",
			timeformat => '%Y/%m/%d %H:%M:%S',	
			message_layout => "%T [%L] %m",
			utf8 => 1
		}
	)
});

sub run {
	my $self=shift;
	$self->log->info('処理開始');
	say "Hello World:)";
	$self->log->info('処理終了');
}

package Main;
Application->new()->run();

