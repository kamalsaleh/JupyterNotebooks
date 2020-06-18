FROM gapsystem/gap-docker-master
MAINTAINER Kamal Saleh <kamal.saleh@uni-siegen.de>

USER root

RUN apt-get update && apt-get install python3-pip -y
RUN apt-get install texlive -y
RUN apt-get install texlive-latex-extra -y
RUN apt-get install texlive-generic-extra -y
RUN apt-get install texlive-xetex -y
RUN apt-get install pandoc -y

RUN cd /home/gap/inst/gap-master/pkg \
    && git clone https://github.com/homalg-project/CddInterface \
    && cd CddInterface \
    && ./install.sh ../.. \
    && cd .. \
    && git clone https://github.com/homalg-project/NConvex \
    && git clone https://github.com/homalg-project/homalg_project \
    && git clone https://github.com/homalg-project/CAP_project \
    && git clone https://github.com/homalg-project/Algebroids \
    && git clone https://github.com/homalg-project/BBGG \
    && git clone https://github.com/homalg-project/Bicomplexes \
    && git clone https://github.com/homalg-project/CategoryConstructor \
    && git clone https://github.com/homalg-project/ComplexesCategories \
    && git clone https://github.com/homalg-project/DerivedCategories \
    && git clone https://github.com/homalg-project/FinSetsForCAP \
    && git clone https://github.com/homalg-project/FinGSetsForCAP \
    && git clone https://github.com/homalg-project/FrobeniusCategories \
    && git clone https://github.com/homalg-project/FunctorCategories \
    && git clone https://github.com/homalg-project/HomotopyCategories \
    && git clone https://github.com/homalg-project/QPA2 \
    && git clone https://github.com/homalg-project/QuotientCategories \
    && git clone https://github.com/homalg-project/StableCategories \
    && git clone https://github.com/homalg-project/SubcategoriesForCAP \
    && git clone https://github.com/homalg-project/TriangulatedCategories

USER gap
WORKDIR $HOME/inst/gap-master/
