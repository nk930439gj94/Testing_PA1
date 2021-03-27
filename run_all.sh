for pattern in patterns/*; do
    circuit=${pattern#*_}
    circuit=${circuit%.*}
    file=sample_circuits/$circuit.ckt
    echo $circuit
    for n in $(seq 1 8); do
        ./src/atpg -fsim $pattern -ndet $n $file >out/${circuit}_$n.out
        ./bin/golden_atpg -fsim $pattern -ndet $n $file >out/${circuit}_$n.ref
    done
done
