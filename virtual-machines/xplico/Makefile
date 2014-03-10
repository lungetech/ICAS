all:
	@echo Make targets include: build, setup, upload-pcap, and clean

setup:
	vagrant up
	vagrant ssh -c "sudo /etc/init.d/xplico start"
	vagrant ssh -c "sudo /opt/xplico/script/session_mng.pyc -n ICAS 'First Case'"

upload-pcap:
	if [ ! -f pcaps/ppa-capture-files.zip ]; then wget http://www.nostarch.com/download/ppa-capture-files.zip -O pcaps/ppa-capture-files.zip; fi
	if [ ! -f pcaps/destunreachable.pcap ]; then (cd pcaps; unzip ppa-capture-files.zip); fi
	vagrant ssh -c "sudo cp /vagrant/pcaps/*.pcap /vagrant/pcaps/*.cap /vagrant/pcaps/*.dmp /opt/xplico/pol_1/sol_1/new"

build:
	packer build vm.json
	vagrant box add xplico ./xplico.box

clean:
	rm -f xplico.box
	vagrant destroy -f
	vagrant box remove xplico
