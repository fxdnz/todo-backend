set -o errexit  # Exit on error

# Install dependencies
pip install -r requirements.txt

# Collect static files
python manage.py collectstatic --no-input

# Run migrations
python manage.py migrate

# Check if CREATE_SUPERUSER is set to 'true' and create superuser
if [[$CREATE_SUPERUSER]]; then
    python manage.py createsuperuser --no-input --email "$DJANGO_SUPERUSER_EMAIL"
fi
