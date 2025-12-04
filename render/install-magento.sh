#!/bin/bash

echo "Starting Magento install..."

composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition .

bin/magento setup:install \
  --base-url="$MAGENTO_BASE_URL" \
  --db-host="$MAGENTO_DB_HOST" \
  --db-name="$MAGENTO_DB_NAME" \
  --db-user="$MAGENTO_DB_USER" \
  --db-password="$MAGENTO_DB_PASSWORD" \
  --admin-firstname=Admin \
  --admin-lastname=User \
  --admin-email=admin@example.com \
  --admin-user=admin \
  --admin-password="$MAGENTO_ADMIN_PASSWORD" \
  --language=nl_NL \
  --currency=EUR \
  --timezone=Europe/Amsterdam \
  --use-rewrites=1

echo "Magento installation complete."
