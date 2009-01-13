use inc::Module::Install;

perl_version '5.008006';
name     'DBIx-Class-Schema-PopulateMore';
all_from 'lib/DBIx/Class/Schema/PopulateMore.pm';
author   'John Napiorkowski <jjn1056@yahoo.com>';

requires 'Moose' => '0.48';
requires 'MooseX::AttributeHelpers' => '0.09';
requires 'DateTimeX::Easy' => '0.082';
requires 'List::MoreUtils' => '0.22';
requires 'Module::Pluggable' => '3.8';
requires 'Data::Visitor' => '0.15';

build_requires 'DBIx::Class' => '0.08010';
build_requires 'Test::More';
build_requires 'File::Find';
build_requires 'File::Temp';
build_requires 'YAML::Tiny';

auto_install;

WriteAll;

