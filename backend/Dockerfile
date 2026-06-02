# Utilisation d'une image légère Node.js (version 18 alpine)
FROM node:18-alpine

# Définition du répertoire de travail dans le conteneur
WORKDIR /app

# Copie des fichiers de configuration des dépendances
COPY package*.json ./

# Installation des dépendances de l'application
RUN npm install

# Copie des dossiers essentiels au fonctionnement du serveur
COPY backend/ ./backend/
COPY uploads/ ./uploads/
COPY frontend/ ./frontend/

# Exposition du port interne de l'API Node.js
EXPOSE 5000

# Commande d'exécution pour démarrer le serveur backend
CMD ["npm", "run", "server"]