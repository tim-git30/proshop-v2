# Utilisation d'une image légère comme demandé par les contraintes [cite: 56]
FROM node:20-alpine

# Définir le dossier de travail
WORKDIR /app

# Copier uniquement les fichiers de dépendances pour optimiser le cache Docker [cite: 68]
COPY package*.json ./

# Installer les dépendances de production uniquement (évite les packages inutiles) [cite: 57]
RUN npm ci --only=production

# Copier le reste du code du backend
COPY . .

# Exposer le port du backend uniquement [cite: 58]
EXPOSE 5000

# Lancer le serveur
CMD ["npm", "start"]