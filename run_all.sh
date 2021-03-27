for pattern in patterns/*; do
    circuit=${pattern#*_}
    circuit=${circuit%.*}
    file=sample_circuits/$circuit.ckt
    ./src/atpg -fsim $pattern $file >out/$circuit.out
    ./bin/golden_atpg -fsim $pattern $file >out/$circuit.ref
done
