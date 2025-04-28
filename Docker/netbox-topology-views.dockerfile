############################
# @author EliasDH Team     #
# @see https://eliasdh.com #
# @since 01/01/2025        #
############################

FROM quay.io/netboxcommunity/netbox:v4.1.1

RUN pip install netbox-topology-views

RUN mkdir -p /opt/netbox/netbox/static/netbox_topology_views/img

RUN python /opt/netbox/netbox/manage.py collectstatic --no-input