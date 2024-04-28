FROM apache/airflow:2.9.0-python3.12

USER root

COPY requirements.txt /tmp/ 

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
    vim-tiny \
    curl \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

## Install PyPI packages
USER airflow
RUN pip install --no-cache-dir -r /tmp/requirements.txt
