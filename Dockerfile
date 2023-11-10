FROM node
RUN useradd -u 1001 -m -d /app app
WORKDIR /app
COPY package.json /app/package.json
RUN npm install
COPY . /app
RUN chown -R 1001:0 /app && chmod -R ug+rwx /app
USER app
CMD npx prisma generate && npx prisma migrate deploy && npx ts-node util/seed.ts && npm run start