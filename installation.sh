#!/bin/bash

# Update the system
sudo yum -y update

# Install the PostgreSQL repository RPM
sudo yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-$(rpm -E %{rhel})-x86_64/pgdg-redhat-repo-latest.noarch.rpm

# Install PostgreSQL
sudo yum -y install postgresql12-server postgresql12-contrib

# Initialize the PostgreSQL database
sudo /usr/pgsql-12/bin/postgresql-12-setup initdb

# Start and enable the PostgreSQL service
sudo systemctl start postgresql-12
sudo systemctl enable postgresql-12

# Optional: Set a password for the default PostgreSQL user 'postgres'
# sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'your_password';"

# Optional: Allow remote connections to PostgreSQL (modify pg_hba.conf and postgresql.conf if needed)
# echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /var/lib/pgsql/12/data/pg_hba.conf
# echo "listen_addresses = '*'" | sudo tee -a /var/lib/pgsql/12/data/postgresql.conf
# sudo systemctl restart postgresql-12

echo "PostgreSQL installation completed."
