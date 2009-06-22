use inc::Module::Install;
name 'Devel-MemoryProfiler';
all_from 'lib/Devel/MemoryProfiler.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;

install_script 'memprof';

WriteAll;
