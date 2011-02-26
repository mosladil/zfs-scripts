#!/usr/bin/perl

use warnings;
use strict;

die "$0: Need to be root" if($>);

my $zfsname = shift or die "Missing filesystem as an argument.\n";
my $day     = `date`;
my $path    = "/usr/sbin";

$day =~ s/(Sun|Mon|Tue|Wed|Thu|Fri|Sat)[\S\s]+/$1/gi;

my $snapname = "$zfsname\@$day";
my $exist = system("$path/zfs list $snapname 2>/dev/null >/dev/null");

# if it already exists, delete it
if($exist == 0) {
    print "Destroying previous weeks snapshot...";
    system("$path/zfs destroy $snapname 2>/dev/null >/dev/null");
    print "Done.\n";
}

print "Creating daily snapshot...";
system("$path/zfs snapshot $snapname 2>/dev/null >/dev/null");
print "Done.\n";

exit 0;
