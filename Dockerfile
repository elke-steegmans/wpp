FROM node
WORKDIR /app
COPY package.json /app/package.json
RUN npm install
COPY . /app
CMD npx prisma generate && npx prisma migrate deploy && npx ts-node util/seed.ts && npm run start