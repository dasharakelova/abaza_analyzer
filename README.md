# abaza_analyzer

# Background
Abaza is a Northwest Caucasian language spoken mainly in Russia. This repository contains a prototype for Abaza morphological analyzer built based on transducer technology. Specifically, the framework we used is HFST which relies on two main formalisms. Lexd is a lexicon compiler that implements the functionality of lexc in an easier, more intuitive fashion.Twol is an additional instrument that imitates two-level phonology and changes the string pairs produced by the lexicon accordingly. A detailed descritpion of the project can be found in [this paper](https://docs.google.com/document/d/1-jmHmJKq803GnBjPasgo-X8pdjsX88qaX1eYLcp17Og/edit#heading=h.qh6q32f1bcbj). 

The analyzer is a part of a larger project at NRU HSE designing NLP tools for low-resource languiages. A demo of a web interface for all the projects including this one can be found [here](http://87.247.157.119:5000/parsers).

The project is distributed under the GNU General Public License v3.0.

## Data
Different grammatical descriptions were used when writing rules for the transducer as well as some linguistic data collected during field trips in 2017-2021 (see the paper for more info). The lexicographic basis of the transducer comes from [“Abazinka”](http://www.abazinka.ru) online resource. Also, [Abaza-Russian parallel news corpus ](https://linghub.ru/abaza_rus_corpus/search) and corpus of spoken Abaza were used for developing and testing the analyzer.


# How to cite:
Developing morphological analyzers for low-resource languages of the Caucasus. D. Arakelova, D. Ignatiev. Term paper at the School of Linguistics, NRU HSE, 2021.
