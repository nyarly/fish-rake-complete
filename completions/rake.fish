function __cache_or_get_rake_completion -d "Create rake completions"
  set -l rf
  set -l rfp
  for r in Rakefile rakefile Rakefile.rb rakefile.rb
    set rfp (lookup $r)
    and set rf $r; and break
  end
  if [ -z $rf ]
    return 0
  end

  __cache_zap rake $rf -not -mnewer $rfp/$rf
  __cache_or_get rake $rf 'rake -T 2>&1 | sed -e "s/^rake \([a-z:_0-9!\-]*\).*#\(.*\)/\1	\2/"'
end

complete -r -c rake -a "(__cache_or_get_rake_completion)"
