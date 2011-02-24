#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';
use inc::Module::Install;

requires 'Moose' => '1.09';
requires 'DateTimeX::Easy' => '0.089';
requires 'List::MoreUtils' => '0.22';
requires 'Module::Pluggable' => '3.9';
requires 'Data::Visitor' => '0.27';

test_requires 'DBIx::Class' => '0.08123';
test_requires 'DateTime::Format::SQLite' => '0.11'; ## needed by DBIC for datetime in/deflators
test_requires 'SQL::Translator' => '0.11006';
test_requires 'Test::More' => '0.96';
test_requires 'File::Find';
test_requires 'YAML::Tiny' => '1.44';
test_requires 'Path::Class' => '0.19';

all_from 'lib/DBIx/Class/Schema/PopulateMore.pm';
require 'maint/Makefile.PL.include'
  if $Module::Install::AUTHOR;

WriteAll;

