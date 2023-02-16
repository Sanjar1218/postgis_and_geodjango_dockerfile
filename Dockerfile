FROM postgis/postgis

ENV POSTGRES_DB=agesamarkand
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

RUN apt-get install -y libboost-dev libboost-filesystem-dev libboost-system-dev libboost-program-options-dev libboost-python-dev libproj-dev libicu-dev libcairo2-dev libcairomm-1.0-dev

RUN apt-get install -y build-essential libssl-dev libffi-dev python3-dev python-dev

COPY requirements.txt .
RUN pip3 install -r requirements.txt
RUN apt-get update
RUN apt-get install -y python3-mapnik

WORKDIR /home




# CMD ["sleep", "10s", "&&", "python3", "manage.py", "runserver", "0.0.0.0:8000"]