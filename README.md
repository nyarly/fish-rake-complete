# Rake Complete

When using rake, it can be kind of a hassle to remember all the weird, inconsistently named tasks you're working with. Was it `rake reboot:server` or `rake servers:reboot`?

At the same time, in a project of any significant size `rake -T` can take a while to run -
certainly too long to use in a completion.
Worse, each project (rightly) defines it's own list of tasks,
so a standard set of completions don't really make sense.

Paradox!
We're stuck with looking up the tasks we want and relying on fish's (awesome) history completions, right?

Not so.
The magic of caching to the rescue.

This plugin will automatically feed you completions for the local-most Rakefile,
updating them either when that file changes
or if you call `zap_rake_cache`
(for instance, because you needed to update `lib/ill_advised_server_management.rake`.)
