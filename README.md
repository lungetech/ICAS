ICAS
====

*Shared resources intended for use by DARPA ICAS*

In order to reduce duplication of effort, these are some of the resources
intended to be used during the ICAS assessment.  Successful integration and
federated queries with these resources will highlight and showcase a few of the
challenges ICAS is trying to solve.

For the network services, there are [Virtual Box](virtual-machines/) based VMs,
created with [Packer](http://www.packer.io) and provisioned with
[Vagrant](http://www.vagrantup.com/).  For offline tools, static logs as well
as the commands to create the logs, are provided.

Network Authentication
----------------------
Dynamism of networks is an on-going challenge for network defenders.  Being
able to tie resources to a host, regardless of its current network status,
location, and connectivity is a key requirement for a successful ICAS solution.  

[Free Radius](virtual-machines/freeradius/), among many other things, is an
enterprise capable 801.X back-end solution.  This image is setup to use MySQL
as a back-end for authentication credentials and logs.

Log storage via databases is a common mechanism in the enterprise, and Free
Radius is no exception.  There are two common back-end data stores used in the
enterprise with this software package, SQL databases and LDAP.  Future
assessments may see services leveraging LDAP.

Forensic Logs
-------------
Incident response often requires detailed end-host knowledge to fully
understand the activities in question.  Numerous commercial and open source
capabilities are trying to capture this growing market in an online fashion.

In order to reduce costs, both on the performers and on the testbed,
[Volatility](logs/volatility/), a traditionally offline mechanism, has been
chosen to provide forensic logs for the upcoming assessment.

There are numerous commercial products attempting to provide the level of
detail that Volatility provides in a distributed live fashion, but for a first
step, performing analysis on the results of such a detailed capability is
likely to be difficult.

Network Forensics
-----------------
Detailed network analytics has been a key tool to understand adversarial impact
to a network.  Gardner describes Network Forensics as upwards of $120 million.
The ability to analyze both current, and past network activity has been an
ongoing challenge for incident response for decades.

[Xplico](virtual-machines/xplico/) is a web-based open source network forensics
capability.  While not as polished as numerous commercial offerings, xplico
provides flow analysis, content extraction, and even chat analysis.  Xplico can
be deployed in both a live and offline fashion.

A publicly available dataset has been integrated into the setup stage to
show basic usage of the capability.
