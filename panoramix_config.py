#---------------------------------------------------------
# Panoramix specifix config
#---------------------------------------------------------
ROW_LIMIT = 5000
WEBSERVER_THREADS = 8

PANORAMIX_WEBSERVER_PORT = 8088
#---------------------------------------------------------

#---------------------------------------------------------
# Flask App Builder configuration
#---------------------------------------------------------
# Your App secret key
SECRET_KEY = 'This_key_is_nearly_impossible_to_guess_'

# The SQLAlchemy connection string.
SQLALCHEMY_DATABASE_URI = 'sqlite:////tmp/panoramix.db'

# Flask-WTF flag for CSRF
CSRF_ENABLED = True

# Whether to run the web server in debug mode or not
DEBUG = True
