#Utiliser l'image officielle de Python 3.11 comme image de base
FROM python:3.11

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers requirements.txt dans le répertoire de travail
COPY requirements.txt .

COPY ./lib /app/lib
RUN apt-get update && \
    apt-get install -y wget unzip libnss3 libgconf-2-4 libxi6 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libatk1.0-0 libpangocairo-1.0-0 libgtk-3-0 

# Installer Google Chrome
RUN dpkg -i /app/lib/chrome_114_amd64.deb || apt-get install -f -y && \
    dpkg -l | grep google-chrome


# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

RUN wget https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_linux64.zip

# Décompresser ChromeDriver
RUN unzip chromedriver_linux64.zip

# Déplacer ChromeDriver vers /usr/local/bin
RUN mv chromedriver /usr/local/bin/chromedriver

# Supprimer le fichier zip téléchargé
RUN rm chromedriver_linux64.zip


# Copier le reste des fichiers de l'application dans le répertoire de travail
COPY . .

# Définir la commande de démarrage
CMD ["python", "app.py"]