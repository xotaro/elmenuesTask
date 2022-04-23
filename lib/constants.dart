const AUTH0_DOMAIN = String.fromEnvironment('AUTH0_DOMAIN');
const AUTH0_CLIENT_ID = String.fromEnvironment('AUTH0_CLIENT_ID');
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';
const BUNDLE_IDENTIFIER = 'com.example.elmenues';
const AUTH0_REDIRECT_URI = '$BUNDLE_IDENTIFIER://login-callback';
const REFRESH_TOKEN_KEY = 'refresh_token';
