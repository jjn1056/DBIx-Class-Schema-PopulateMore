use warnings;
use strict;

use inc::Module::Install '1.00';

perl_version '5.008008';
name     'DBIx-Class-Schema-PopulateMore';
all_from 'lib/DBIx/Class/Schema/PopulateMore.pm';
author   'John Napiorkowski <jjnapiork6@cpan.org>';
repository 'git@github.com:jjn1056/DBIx-Class-Schema-PopulateMore.git';

requires 'Moose' => '1.09';
requires 'DateTimeX::Easy' => '0.089';
requires 'List::MoreUtils' => '0.22';
requires 'Module::Pluggable' => '3.9';
requires 'Data::Visitor' => '0.27';

build_requires 'DBIx::Class' => '0.08123';
build_requires 'DateTime::Format::SQLite' => '0.11'; ## needed by DBIC for datetime in/deflators
build_requires 'SQL::Translator' => '0.11006';
build_requires 'Test::More' => '0.96';
build_requires 'File::Find';
build_requires 'YAML::Tiny' => '1.44';
build_requires 'Path::Class' => '0.19';

auto_install;
tests_recursive;
WriteAll;

