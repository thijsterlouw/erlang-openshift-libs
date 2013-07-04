erlang-openshift-libs
=====================

Erlang Openshift libraries. WORK IN PROGRESS!!



Features
========
 * Custom distribution protocol which ensures that our public listen port (for Erlang distribution) is registered in EPMD
   instead of the private listen port. This is required because each gear has a private IP-range. This is not available 
   from other gears, and thus needs to be proxied. Erlang nodes first ask EPMD for the port and then connect directly
   to it. Thus we should tell EPMD to register the public port (on the proxy) instead of the private listen port.



Usage
=====

 * ``erl -pa ebin -name test -proto_dist inet_openshift -kernel inet_dist_listen_external 3000``
   Explanation:
   ``-name test`` is required to make the node distributed (and thus register with EPMD + setup a listen port)
   ``-proto_dist`` allows us to customize the distribution protocol. Our custom protocol registers the correct port.
   ``-kernel inet_dist_listen_external 30000`` instructs our custom inet_openshift_dist protocol to register port
   30000 with EPMD instead of the default listen port.

