function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
	hello_world_api_url: 'https://sandbox.api.service.nhs.uk/hello-world/hello/world',
    spartan_base_url: 'http://54.92.206.194:8000/api',
    bookit_base_url: 'https://cybertek-reservation-api-qa.herokuapp.com'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}