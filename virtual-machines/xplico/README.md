Example uses
============

``` sh
packer build vm.json
vagrant box add xplico xplico.box

vagrant up
vagrant ssh -c "sudo /etc/init.d/xplico start"
vagrant ssh -c "sudo /opt/xplico/script/session_mng.pyc -n ICAS 'First Case'"

mkdir -p pcaps
wget http://www.nostarch.com/download/ppa-capture-files.zip -O pcaps/ppa-capture-files.zip
(cd pcaps; unzip ppa-capture-files.zip)
vagrant ssh -c "sudo cp /vagrant/pcaps/*.pcap /vagrant/pcaps/*.cap /vagrant/pcaps/*.dmp /opt/xplico/pol_1/sol_1/new"

```

Once the VM has been setup as above, browse to http://localhost:9876/

