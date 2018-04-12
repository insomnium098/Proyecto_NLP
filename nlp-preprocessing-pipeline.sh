#!/bin/sh
echo 'Preprocessing files...'
ORIGINAL_CORPUS_PATH=/home/daniel/Documents/Proyecto_NLP/ARCHIVOS_NECESARIOS/ORIGINAL_CORPUS_PATH/original
CORPUS_PATH=/home/daniel/Documents/Proyecto_NLP/conditional-random-fields/data-sets
TERM_PATH=/home/daniel/Documents/Proyecto_NLP/dictionaries
POST_PATH=/home/daniel/Documents/Proyecto_NLP/ARCHIVOS_NECESARIOS/POST_PATH/stanford-postagger-2018-02-27
LEMMA_PATH=/home/daniel/Documents/Proyecto_NLP/ARCHIVOS_NECESARIOS/LEMMA/biolemmatizer

PRE=TRUE
echo "   Preprocessing: $PRE"
POS=TRUE
echo "   POS Tagging: $POS"
LEMMA=TRUE
echo "   Lemmatization: $LEMMA"
TERM=TRUE
echo "   Terminological tagging: $TERM"
TRANS=TRUE
echo "   Transformation: $TRANS"

if [ "$PRE" = "TRUE" ]; then
echo "Preprocessing..."
INPUT_PATH=$ORIGINAL_CORPUS_PATH
OUTPUT_PATH=$CORPUS_PATH/preprocessed
python3.5 preprocessingTermDetection.py --inputPath $INPUT_PATH --outputPath $OUTPUT_PATH --termDetection --termPath $TERM_PATH --termFiles termFilesLength.json > outputPreprocessing.txt
fi

if [ "$POS" = "TRUE" ]; then
echo "POS Tagging..."
INPUT_PATH=$CORPUS_PATH/preprocessed
OUTPUT_PATH=$CORPUS_PATH/pos
python3.5 posTaggingStanford.py --inputPath $INPUT_PATH --outputPath $OUTPUT_PATH --taggerPath $POST_PATH --biolemmatizer > outputPOST.txt
fi

if [ "$LEMMA" = "TRUE" ]; then
echo "Lemmatization..."
INPUT_PATH=$CORPUS_PATH/pos
OUTPUT_PATH=$CORPUS_PATH/lemma
python3.5 biolemmatizing.py --inputPath $INPUT_PATH --outputPath $OUTPUT_PATH --biolemmatizerPath $LEMMA_PATH  > outputLemma.txt
fi

if [ "$TERM" = "TRUE" ]; then
echo "Terminological tagging..."
INPUT_PATH=$CORPUS_PATH/lemma
OUTPUT_PATH=$CORPUS_PATH/term
python3.5 biologicalTermTagging-CRF.py --inputPath $INPUT_PATH --outputPath $OUTPUT_PATH --termPath $TERM_PATH --termFiles termFilesTag.json > outputTerm.txt
fi

if [ "$TRANS" = "TRUE" ]; then
echo "Transformation..."
INPUT_PATH=$CORPUS_PATH/term
OUTPUT_PATH=$CORPUS_PATH/transformed
python3.5 transforming-CRF.py --inputPath $INPUT_PATH --outputPath $OUTPUT_PATH --minWordsInLine 5 > outputTransformation.txt
fi
