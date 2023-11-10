FROM node
WORKDIR /app
COPY package.json /app/package.json
RUN npm install
COPY . /app
RUN chgrp -R 0 /app && chmod -R ug+rwx /app
CMD npx prisma generate && npx prisma migrate deploy && npx ts-node util/seed.ts && npm run start