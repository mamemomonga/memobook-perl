#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use feature 'say';
binmode(STDIN, ':utf8');
binmode(STDOUT,':utf8');
binmode(STDERR,':utf8');

use FindBin;
use lib "$FindBin::Bin/local/lib/perl5";

use IO::All;
my $text="こんにちは世界!\n";
io("hello.txt")->utf8->print($text);

do_system('cat','hello.txt');

sub do_system {
	my @args=@_;

	say "[RUN] ".join(" ",@args);
	system(@args);

	if ($? == -1) {
		die "---- failed to execute: $!\n";
	} elsif ($? & 127) {
		die sprintf("---- child died with signal %d, %s coredump\n",($? & 127),($? & 128) ? 'with' : 'without');
	} else {
		my $ce=$? >> 8;
		die sprintf("---- child exited with value %d\n", $ce) if $ce != 0;
	}
}
