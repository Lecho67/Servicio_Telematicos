$ORIGIN .
$TTL 604800     ; 1 week
empresa.local.com       IN SOA  empresa.local.com. root.empresa.local.com. (
                                5          ; serial
                                604800     ; refresh (1 week)
                                86400      ; retry (1 day)
                                2419200    ; expire (4 weeks)
                                604800     ; minimum (1 week)
                                )
                        NS      ns.empresa.local.com.
$ORIGIN empresa.local.com.
cli                     A       192.168.70.4
mail                    CNAME   ns
ns                      A       192.168.70.3
server                  CNAME   ns
~                                     
