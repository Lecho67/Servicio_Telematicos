$TTL    604800
@       IN      SOA     simon.com. root.simon.com. (
                              8         ; Serial (incrementa este número)
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      parcial.simon.com.

parcial.simon.com.  IN  A       192.168.70.3  ; Glue record necesario
parcial             IN  A       192.168.70.3
cli                 IN  A       192.168.70.6
server              IN  CNAME   parcial
mail                IN  CNAME   parcial
