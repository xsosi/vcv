FROM nikolaik/python-nodejs:python3.10-nodejs19

RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/
RUN pip3 install --no-cache-dir -U -r requirements.txt
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/usefixie/fixie-wrench/HEAD/install.sh)"

CMD python3 main.py
