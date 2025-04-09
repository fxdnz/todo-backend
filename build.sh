set -o errexit  # Exit on error

# Install dependencies
pip install -r requirements.txt

# Collect static files
python manage.py collectstatic --no-input

# Run migrations
python manage.py migrate

# Check if CREATE_SUPERUSER is set to 'true' and create superuser
if [[ "$CREATE_SUPERUSER" == "true" ]]; then
    python manage.py createsuperuser --no-input \
        --username "$DJANGO_SUPERUSER_USERNAME" \
        --email "$DJANGO_SUPERUSER_EMAIL" \
        --password "$DJANGO_SUPERUSER_PASSWORD"
fi
