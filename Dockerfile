FROM postgis/postgis

ENV POSTGRES_DB=agesamarqand
ENV POSTGRES_USER=sanjarbek
ENV POSTGRES_PASSWORD=gilos123

RUN apt-get update && apt-get install -y \
python3-pip\
    #geodjango
    binutils \
    libproj-dev \
    gdal-bin \
    # postgresql
    libpq-dev postgresql-client && \
    apt-get clean all && rm -rf /var/apt/lists/* && rm -rf /var/cache/apt/*


COPY requirements.txt .
RUN pip3 install -r requirements.txt

WORKDIR /home
# CMD ["sleep", "10s", "&&", "python3", "manage.py", "runserver", "0.0.0.0:8000"]