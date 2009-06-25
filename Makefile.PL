use inc::Module::Install;

perl_version '5.008008';
name     'DBIx-Class-Schema-PopulateMore';
all_from 'lib/DBIx/Class/Schema/PopulateMore.pm';
author   'John Napiorkowski <jjn1056@yahoo.com>';

requires 'Moose' => '0.83';
requires 'MooseX::AttributeHelpers' => '0.19';
requires 'DateTimeX::Easy' => '0.087';
requires 'List::MoreUtils' => '0.22';
requires 'Module::Pluggable' => '3.9';
requires 'Data::Visitor' => '0.25';

build_requires 'DBIx::Class' => '0.08107';
build_requires 'Test::More';
build_requires 'File::Find';
build_requires 'YAML::Tiny';
build_requires 'Path::Class';

auto_install;

WriteAll;

