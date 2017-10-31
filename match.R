#!/usr/bin/perl

open(IN, $ARGV[0]);

my $num=1;
while(my $line=<IN>)
{
  $a=$line;
  chomp($a);
  if ($line=~/^\s{1,}/ && $line !~ /^$/)
  {
    $a=~/^(\s+)/;
    my $len=length($1);
    if ($len%4!=0)
    {
       print "$num:$a\n";
    }
  }
  $num++;
}

