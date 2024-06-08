FROM datamechanics/spark:3.2.1-hadoop-3.3.1-java-11-scala-2.12-python-3.8-dm18

USER root

RUN pip install --upgrade pip

COPY requirements.txt .
RUN pip3 install -r requirements.txt

RUN pip3 install pysqlite3-binary


RUN wget https://repo1.maven.org/maven2/org/xerial/sqlite-jdbc/3.46.0.0/sqlite-jdbc-3.46.0.0.jar -P /opt/spark/jars

WORKDIR /myProject
 
COPY  csv_to_sqlite.ipynb ./csv_to_sqlite.ipynb
COPY  query.ipynb ./query.ipynb
COPY  testSpark.ipynb ./testSpark.ipynb
COPY  /yelp_database.csv ./yelp_database.csv

EXPOSE 8888

CMD jupyter-lab --allow-root --no-browser --ip=0.0.0.0