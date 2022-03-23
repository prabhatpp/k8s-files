FROM python:3.6
COPY . /app/
RUN ls -a /app/django_school/django_school/
WORKDIR /app/
RUN pip install -r requirements.txt
WORKDIR /app/django_school
CMD ./entrypoint.sh
