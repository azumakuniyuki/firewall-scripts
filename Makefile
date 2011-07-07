# $Id: Makefile,v 1.2 2009/04/29 13:55:29 ak Exp $
# Makefile for firewall-scripts
#  __  __       _         __ _ _      
# |  \/  | __ _| | _____ / _(_) | ___ 
# | |\/| |/ _` | |/ / _ \ |_| | |/ _ \
# | |  | | (_| |   <  __/  _| | |  __/
# |_|  |_|\__,_|_|\_\___|_| |_|_|\___|
# ---------------------------------------------------------------------------
#
FWDIR	= /etc/firewall
SCRIPT	= make-linux-iptables
FILES	= attacker-hosts belogged-hosts extroot-hosts firewall-rules \
	  monitor-hosts my-ipv4-address other-commands spammer-hosts \
	  trusted-hosts

install:
	test -d $(FWDIR) || mkdir -pm 0700 $(FWDIR)
	for F in $(FILES); do \
		test -s $(FWDIR)/$$F || install -o root -g root -vpm 0644 $$F $(FWDIR)/ ;\
	done
	install -o root -g root -vpm 0744 $(SCRIPT) $(FWDIR)/
	install -o root -g root -vpm 0444 README $(FWDIR)/

diff:
	@diff -u ./$(SCRIPT) $(FWDIR)/$(SCRIPT)
	@diff -u ./firewall-rules $(FWDIR)/firewall-rules

