#

for fn in $*
do
      echo $fn
      for TTT in png # pdf  # Output format TTTypes
      do 
            for KK in dot fdp circo  ## Layout KKinds 
            do 
            echo $KK; 
            dot -T$TTT -K$KK -o $fn-$KK.$TTT $fn ; 
            done; 
      done; 
done
