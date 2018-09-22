# NAME

Devel::ManualProf - It's new $module

# SYNOPSIS

```perl
use Devel::ManualProf;
my $profiler = Devel::ManualProf->new('./profile.tsv');
$profiler->begin("hoge");
...
$profiler->end("hoge");

$profiler->begin("fuga");
...
$profiler->end("fuga");
```

Then this module outputs to profile.tsv in the following format.

```
name:hoge	time:234
name:fuga	time:1222
name:fuga	time:1322
name:hoge	time:111
```

# DESCRIPTION

Devel::ManualProf is ...

# LICENSE

Copyright (C) shibayu36.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

shibayu36 <shibayu36@gmail.com>
