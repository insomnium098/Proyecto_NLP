# Proyecto_NLP

##Paso 1: Correr script nlp-preprocessing-pipeline 

Se uso la version 3.5 de python
Se deben de tener instalados los paquetes de python nltk, los archivos "words", "punkt" de nltk, scipy, sklearn

### WORDS NLTK

  >>> import nltk
  >>> nltk.download('words')
  >>> nltk.download('punkt')


###

##Paso 2: Correr scripts de Conditional Random Fields


#########
#########
NOTA: No se pudo replicar el uso de estos dos scripts

python3.5 prepare-abstracts.py --inputPath /Users/daniel/Desktop/conditional-random-fields/data-sets --inputFile /Users/daniel/Desktop/conditional-random-fields/data-sets/text-annotated-abstracts.txt --outputPath /Users/daniel/Desktop/conditional-random-fields/data-sets/original --dicPath /Users/daniel/Desktop/conditional-random-fields/data-sets/original --dicFile genes.txt


####Correccion <- usar como input path la carpeta transformed del NLP
python3.5 prepare-training-test.py --inputPath /Users/daniel/Desktop/conditional-random-fields/data-sets/original --trainingFile training-data-set-70.txt --testFile test-data-set-30.txt --outputPath /Users/daniel/Desktop/conditional-random-fields/data-sets/

###########
###########

###PASO3


python3.4 training-validation-v1.py --inputPath /Users/daniel/Desktop/conditional-random-fields/data-sets --trainingFile training-data-set-70.txt --testFile test-data-set-30.txt --outputPath /Users/daniel/Desktop/conditional-random-fields



