for o in out/*.out; do
    r=${o%.out}.ref
    diff $o $r
done