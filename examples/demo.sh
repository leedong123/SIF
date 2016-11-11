DATADIR=../data
WORDFILE=$DATADIR/glove.840B.300d.txt

# download word vector
if [ ! -e $WORDFILE ]; then
wget http://nlp.stanford.edu/data/glove.840B.300d.zip
unzip glove.840B.300d.zip -d $DATADIR
rm glove.840B.300d.zip
fi

# textual similarity tasks
python sim_sif.py 2>&1 | tee log/output_sim_sif.py
python sim_tfidf.py 2>&1 | tee log/output_sim_tfidf.py

# supervised tasks
./supervised_sif_proj.sh 2>&1 | tee log/output_supervised_sif_proj.txt