<?php

/**
 * DKIM is used to sign e-mails. If you change your RSA key, apply modifications to
 * the DNS DKIM record of the mailing (sub)domain too !
 * Disclaimer : the php openssl extension can be buggy with Windows, try with Linux first
 * 
 * To generate a new private key with Linux :
 * openssl genrsa -des3 -out private.pem 1024
 * Then get the public key
 * openssl rsa -in private.pem -out public.pem -outform PEM -pubout
 */

// Edit with your own info :

define('MAIL_RSA_PASSPHRASE', '');

define('MAIL_RSA_PRIV',
'-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQDBcvxjFGEnMAuoh+s83QmuTo63pc/2Q1L+plS9wF73cIzmlGBk
bUyzBZi9PMYSl2JN42Ylf/ePH2eWj0+1OyuE3rdiAXDrTa311syuUmSQWrGO10Co
iQwax0jJmY0+0C+qlB4weOcg9CIGkG9GAoIomiTu0C+6tA3k92rqYiRdjQIDAQAB
AoGAFWo8RF+iLatk7wA062TwyGoL5IqnjfSAAI67PNJJ8Qx1nKT6UsPCxOKuuOw8
ZRx7FnJBAY+8AQ0R85nj0gU92ONIBp0S3OTHqDZ9cpDmYcnbX17VmgXwJXBzNGxi
yM1EQZQnPlxYQMpw7V2SvmnDt3NEWaqaoHemsFyQv5flVgUCQQDuR2J4K7IyiPkI
GcGsk6hBPZEsyZiARb4G88cEaGZRQzRe/401mB7YTJG70BPpuFPwA/Us2SJkrhue
pd5tXYaTAkEAz9YVliILSDh3NZrbfIiCv+Q6R6pNjdUZOmYg1k9Sy5kfJHiQSyff
C5OwqHCeXyTldhbHo65HNob9IzypIfH/XwJAeWYpRyyMF68tofDtee2o9cRWaMk1
R3VBAe3F4fsG1jQ1RIlS+pFMdctdHKFA4/0j1s9NZNIj8cO7ErNThcj2vQJBALQL
DFYrlcRxjet1BDBkfYfIKSiOAnMcqKcrc8TToLDZK95HRxCkMJdx0LaKINfhOZpL
75P+1JgK5l1RHl9WqVcCQC26D7s2AieO/vxjiN20kCwet5GQ5PsAoK+iXdlcg0NA
jPuyTZQmGZRvaRS172NeC0m1OiZi/+gwCgBL1LD83SM=
-----END RSA PRIVATE KEY-----
');

define('MAIL_RSA_PUBL',
'-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDBcvxjFGEnMAuoh+s83QmuTo63pc/2Q1L+plS9wF73cIzmlGBkbUyzBZi9PMYSl2JN42Ylf/ePH2eWj0+1OyuE3rdiAXDrTa311syuUmSQWrGO10CoiQwax0jJmY0+0C+qlB4weOcg9CIGkG9GAoIomiTu0C+6tA3k92rqYiRdjQIDAQAB
-----END PUBLIC KEY-----');

// Domain or subdomain of the signing entity (i.e. the domain where the e-mail comes from)
define('MAIL_DOMAIN', 'top3dshop.ru');  

// Allowed user, defaults is "@<MAIL_DKIM_DOMAIN>", meaning anybody in the MAIL_DKIM_DOMAIN
// domain. Ex: 'admin@mydomain.tld'. You'll never have to use this unless you do not
// control the "From" value in the e-mails you send.
define('MAIL_IDENTITY', NULL);

// Selector used in your DKIM DNS record, e.g. : selector._domainkey.MAIL_DKIM_DOMAIN
define('MAIL_SELECTOR', 'dkim');

?>