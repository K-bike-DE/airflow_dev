FROM apache/airflow:2.5.1-python3.8
USER root

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
         vim \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*


USER airflow
COPY ./dags /opt/airflow/dags
COPY ./plugins /opt/airflow/plugins
RUN pip install --user --upgrade pip