#!/bin/sh
# Check for Apps before starting
if [ `which flac| grep flac|wc -l` -eq 0 ]
then
  echo "flac not installed"
  exit 0
fi

# Create Direcotry of converted files
OUT_DIR="./wav2flac"
[ ! -d $OUT_DIR ] && mkdir -p $OUT_DIR

# Modify FLAC preferences
# http://linux.die.net/man/1/flac
# flac_opts="--compression-level-5 --replay-gain"
# Default Values ^ Lvl 5 Compression, Apply ReplayGain Tag

flac_opts="--compression-level-5 --replay-gain"

# Loop every .wav file
for x in *.wav
do FLACFILE=`basename "${x%.wav}.flac"`

# Then convert .wav to .flac
echo "Converting ${x} to FLAC format"
flac $flac_opts "$x" --output-name=$OUT_DIR/"$FLACFILE"
done
