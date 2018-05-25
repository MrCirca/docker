FROM debian

RUN apt update && apt -y dist-upgrade && apt install -y freeradius vim freeradius-ldap

COPY --chown=freerad:freerad default /etc/freeradius/3.0/sites-available/default

COPY --chown=freerad:freerad inner-tunnel /etc/freeradius/3.0/sites-available/inner-tunnel

COPY --chown=freerad:freerad eap /etc/freeradius/3.0/mods-available/eap

RUN rm -f /etc/freeradius/3.0/sites-enabled/default

RUN rm -f /etc/freeradius/3.0/sites-enabled/inner-tunnel

RUN rm -f /etc/freeradius/3.0/mods-enabled/eap

RUN ln -s /etc/freeradius/3.0/sites-available/default /etc/freeradius/3.0/sites-enabled/default

RUN ln -s /etc/freeradius/3.0/sites-available/inner-tunnel /etc/freeradius/3.0/sites-enabled/inner-tunnel

RUN ln -s /etc/freeradius/3.0/mods-available/eap /etc/freeradius/3.0/mods-enabled/eap
RUN chown -h freerad:freerad /etc/freeradius/3.0/mods-enabled/*
RUN chown -h freerad:freerad /etc/freeradius/3.0/sites-enabled/*




