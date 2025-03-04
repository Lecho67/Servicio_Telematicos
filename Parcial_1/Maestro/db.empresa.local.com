$TTL    604800
@       IN      SOA     empresa.local.com. root.empresa.local.com. (
                              5         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      ns.empresa.local.com.
ns      IN      A       192.168.70.3
cli     IN      A       192.168.70.4
server  IN      CNAME   ns
mail    IN      CNAME   ns
