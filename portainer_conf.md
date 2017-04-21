http://portainer.readthedocs.io/en/stable/configuration.html


$  docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /Users/phu021/endpoints:/endpoints  --name myportainer portainer/portainer  --external-endpoints /endpoints/external_end_point.json 



http://portainer.readthedocs.io/en/stable/external_endpoints.html

[
  {
    "Name": "my-first-endpoint",
    "URL": "tcp://myendpoint.mydomain:2375"
  },
  {
    "Name": "my-second-endpoint",
    "URL": "tcp://mysecondendpoint.mydomain:2375",
    "TLS": true,
    "TLSCACert": "/tmp/ca.pem",
    "TLSCert": "/tmp/cert.pem",
    "TLSKey": "/tmp/key.pem"
  }
]
