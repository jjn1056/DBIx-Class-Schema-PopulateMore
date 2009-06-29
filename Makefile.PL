use inc::Module::Install;

perl_version '5.008008';
name     'DBIx-Class-Schema-PopulateMore';
all_from 'lib/DBIx/Class/Schema/PopulateMore.pm';
author   'John Napiorkowski <jjn1056@yahoo.com>';

requires 'Moose' => '0.85';
requires 'MooseX::AttributeHelpers' => '0.20';
requires 'DateTimeX::Easy' => '0.087';
requires 'List::MoreUtils' => '0.22';
requires 'Module::Pluggable' => '3.9';
requires 'Data::Visitor' => '0.25';

build_requires 'DBIx::Class' => '0.08107';
build_requires 'DateTime::Format::SQLite' => '0.10'; ## needed by DBIC for datetime in/deflators
build_requires 'SQL::Translator' => '0.09007';
build_requires 'Test::More' => '0.88';
build_requires 'File::Find';
build_requires 'YAML::Tiny' => '1.39';
build_requires 'Path::Class' => '0.17';

auto_install;

WriteAll;

