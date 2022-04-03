FROM rayproject/ray-ml
RUN sudo apt-get update
RUN sudo apt-get install unzip
COPY R88R.zip /home/ray
COPY requirements.txt /home/ray
RUN unzip R88R.zip
RUN pip install -r requirements.txt
RUN echo "export PYTHONPATH=/home/ray" >> ~/.bashrc
RUN pip install cffi --extra-index-url=file:///home/conda/feedstock_root/build_artifacts/cffi_1606236098182/work
RUN pip install pycparser --extra-index-url=file:///home/conda/feedstock_root/build_artifacts/pycparser_1593275161868/work
RUN pip install PyICU --extra-index-url=file:///home/conda/feedstock_root/build_artifacts/pyicu_1610746111298/work
RUN pip install six --extra-index-url=file:///home/conda/feedstock_root/build_artifacts/six_1590081179328/work
RUN pip install textract --extra-index-url=https://certificatefiles.s3.amazonaws.com/textract-1.6.3-py3-none-any.whl
RUN rm -rf /home/ray/R88R.zip
RUN rm -rf requirements.txt