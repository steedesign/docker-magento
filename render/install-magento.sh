#!/bin/bash

echo "Starting Magento install..."

# 1) Composer authenticatie voor repo.magento.com
if [ -z "$MAGENTO_REPO_PUBLIC_KEY" ] || [ -z "$MAGENTO_REPO_PRIVATE_KEY" ]; then
  echo "ERROR: MAGENTO_REPO_PUBLIC_KEY en/of MAGENTO_REPO_PRIVATE_KEY niet gezet."
  exit 1
fi

composer config --global http-basic.repo.magento.com "$MAGENTO_REPO_PUBLIC_KEY" "$MAGENTO_REPO_PRIVATE_KEY"

# 2) Magento project ophalen
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition .

# 3) Magento installatie
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
