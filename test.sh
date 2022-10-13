
for i in {1..100}; do timeout -k 1 1.5 echo $i && ./UnitTests; done | tee ./UnitTests.log
